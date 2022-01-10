module TeamStatistics

  def team_info(team_id)
    team_info_full = @teams_data.find do |row|
      row.team_id == team_id
    end
    team_info = {
      "team_id" => team_info_full.team_id,
      "franchise_id" => team_info_full.franchiseid,
      "team_name" => team_info_full.teamname,
      "abbreviation" => team_info_full.abbreviation,
      "link" => team_info_full.link}
    team_info
  end

  def best_season(team_id)
    seasons = []
    wins = find_outcome(team_id, "WIN")
    wins.each do |win|
      @games_data.each do |game|
        if (game.game_id == win.game_id)
          seasons << game.season
        end
      end
    end
    best_season = seasons.max_by{|season| seasons.count(season)}
  end

  def worst_season(team_id)
    seasons = []
    wins = find_outcome(team_id, "LOSS")
    wins.each do |win|
      @games_data.each do |game|
        if (game.game_id == win.game_id)
          seasons << game.season
        end
      end
    end
    worst_season = seasons.max_by{|season| seasons.count(season)}
  end

  def average_win_percentage(team_id)
    total_wins = @game_teams_data.count do |game|
      game.team_id == team_id && game.result == "WIN"
    end
    total_games = @game_teams_data.count do |game|
      game.team_id == team_id
    end
    (total_wins.to_f / total_games).round(2)
  end

  def most_goals_scored(team_id)
    @game_teams_data.max_by do |game|
      game.team_id == team_id ? game.goals : 0
    end.goals
  end

  def fewest_goals_scored(team_id)
    @game_teams_data.select do |game|
      game.team_id == team_id
    end.min_by {|team| team.goals}.goals
  end

  def favorite_opponent(team_id)
    total_games = @games_data.select do |game|
      game.home_team_id == team_id || #&& game.home_goals > game.away_goals ||
      game.away_team_id == team_id #&& game.away_goals > game.home_goals
    end

    new_hash = {}
    total_games.each do |game|
      if game.home_team_id == team_id && new_hash[game.away_team_id].nil?
        new_hash[game.away_team_id] = [0,0]
      elsif game.away_team_id == team_id && new_hash[game.home_team_id].nil?
        new_hash[game.home_team_id] = [0,0]
      end
    end

    games_won = @games_data.select do |game|
      game.home_team_id == team_id && game.home_goals > game.away_goals ||
      game.away_team_id == team_id && game.away_goals > game.home_goals
    end

  
    require "pry"; binding.pry
    # += 1 for each game into index[0]
    # += 1 for each win into index[1]

    opponents = []
    games_won.select do |game|
      if game.home_team_id == team_id
        opponents << game.away_team_id
      elsif game.away_team_id == team_id
        opponents << game.home_team_id
      end
    end
    opponent_name = opponents.max_by do |x|
      x.size
    end
    team_info(opponent_name)["team_name"]
  end

  def rival(team_id)
    games_lost = @games_data.select do |game|
      game.home_team_id == team_id && game.away_goals > game.home_goals ||
      game.away_team_id == team_id && game.home_goals > game.away_goals
    end
    rivals = []
    games_lost.select do |game|
      if game.home_team_id == team_id
        rivals << game.away_team_id
      elsif game.away_team_id == team_id
        rivals << game.home_team_id
      end
    end
    rival_name = rivals.max_by do |x|
      x.size
    end
    team_info(rival_name)["team_name"]
  end

  private
  def find_outcome(team_id, desired_result)
    @game_teams_data.select do |x|
      (x.team_id == team_id) && (x.result == desired_result) #|| (x.result == "TIE"))
    end
  end
end
