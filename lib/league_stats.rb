require 'csv'
module LeagueStats

  def count_of_teams(data)
    contents = CSV.open data, headers: true, header_converters: :symbol
    teams = contents.map do |row|
      :team_id
    end.count
  end

  def goal_data_by_team(games_data, teams_data)
    teams_data = CSV.open teams_data, headers: true, header_converters: :symbol
    games_data = CSV.open games_data, headers: true, header_converters: :symbol
    goals_per_team = {}
    # gets all goal data from games.csv
    games_data.each do |row|
      if !goals_per_team.has_key?(row[:away_team_id])
        goals_per_team[row[:away_team_id]] = {team_name: nil,
          goals_while_away: row[:away_goals].to_i,
          goals_while_home: 0,
          total_goals: row[:away_goals].to_i,
          away_games_played: 1,
          home_games_played: 0,
          total_games_played: 1,
          avg_goals_per_game_away: 0,
          avg_goals_per_game_home: 0,
          avg_goals_per_game_total: 0}
      elsif goals_per_team.has_key?(row[:away_team_id])
        (goals_per_team[row[:away_team_id]][:goals_while_away] += row[:away_goals].to_i) && (goals_per_team[row[:away_team_id]][:total_games_played] += 1) &&
        (goals_per_team[row[:away_team_id]][:total_goals] += row[:away_goals].to_i) && (goals_per_team[row[:away_team_id]][:away_games_played] += 1)
      end
      if !goals_per_team.has_key?(row[:home_team_id])
        goals_per_team[row[:home_team_id]] = {team_name: nil,
          goals_while_away: 0,
          goals_while_home: row[:home_goals].to_i,
          total_goals: row[:home_goals].to_i,
          away_games_played: 0,
          home_games_played: 1,
          total_games_played: 1,
          avg_goals_per_game_away: 0,
          avg_goals_per_game_home: 0,
          avg_goals_per_game_total: 0}
      elsif goals_per_team.has_key?(row[:home_team_id])
        (goals_per_team[row[:home_team_id]][:goals_while_home] += row[:home_goals].to_i) && (goals_per_team[row[:home_team_id]][:total_games_played] += 1) &&
        (goals_per_team[row[:home_team_id]][:total_goals] += row[:home_goals].to_i) && (goals_per_team[row[:home_team_id]][:home_games_played] += 1)
      end
    end
    # calculates averages and assigns team names
    teams_data.each do |row|
      goals_per_team.each_pair do |team, stats|
        row[:team_id] == team ? stats[:team_name] = row[:teamname] : next
        stats[:avg_goals_per_game_total] = stats[:total_goals].fdiv(stats[:total_games_played])
        stats[:avg_goals_per_game_away] = stats[:goals_while_away].fdiv(stats[:away_games_played])
        stats[:avg_goals_per_game_home] = stats[:goals_while_home].fdiv(stats[:home_games_played])
      end
    end
    goals_per_team
  end

  def best_offense(games_data, teams_data)
    best_offense = nil
    highest_average = 0
    goal_data_by_team(games_data, teams_data).each_pair do |team, data|
      if data[:avg_goals_per_game_total] >= highest_average
        highest_average = data[:avg_goals_per_game_total]
        (best_offense = data[:team_name])
      end
    end
    best_offense
  end

  def worst_offense(games_data, teams_data)
    worst_offense = nil
    lowest_average = 100
    goal_data_by_team(games_data, teams_data).each_pair do |team, data|
      if data[:avg_goals_per_game_total] < lowest_average
        lowest_average = data[:avg_goals_per_game_total]
        (worst_offense = data[:team_name])
      end
    end
    worst_offense
  end

  def highest_scoring_visitor(games_data, teams_data)
    highest_away = 0
    highest_scoring_visitor = nil
    goal_data_by_team(games_data, teams_data).each_pair do |team, data|
      if data[:avg_goals_per_game_away] > highest_away
        highest_away = data[:avg_goals_per_game_away]
        highest_scoring_visitor = data[:team_name]
      end
    end
    highest_scoring_visitor
  end

  def highest_scoring_home_team(games_data, teams_data)
    highest_home = 0
    highest_scoring_home = nil
    goal_data_by_team(games_data, teams_data).each_pair do |team, data|
      if data[:avg_goals_per_game_home] > highest_home
        highest_home = data[:avg_goals_per_game_home]
        highest_scoring_home = data[:team_name]
      end
    end
    highest_scoring_home
  end

  
end
