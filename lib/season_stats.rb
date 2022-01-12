require 'csv'
module SeasonStats
  def games_played_in_season(season)
    games_by_season = @games_data.group_by {|game| game.season}
    games_in_season = games_by_season.keep_if {|key, value| key == season}
    season_game_ids = games_in_season.map {|season, games| games.map {|game| game.game_id}}.flatten
    @game_teams_data.find_all{|games| season_game_ids.include?(games.game_id)}
  end

  def game_stats_by_team_id(season)
    games_played_in_season(season).group_by{|game_teams| game_teams.team_id}
  end

  def winningest_coach(season)
    games_played_in_season(season)
    games_played_by_coach = games_played_in_season(season).group_by {|game| game.head_coach}
    number_of_games_coached = games_played_by_coach.transform_values {|value| value.count}
    games_won = games_played_by_coach.transform_values {|value| value.select {|game| game.result == "WIN"}}.transform_values {|value| value.count}
    avg = number_of_games_coached.merge(games_won){|key, games_played, games_won| games_won.to_f / games_played.to_f}
    coach_name = avg.key(avg.values.max)
  end

  def worst_coach(season)
    games_played_in_season(season)
    games_played_by_coach = games_played_in_season(season).group_by {|game| game.head_coach}
    number_of_games_coached = games_played_by_coach.transform_values {|value| value.count}
    games_won = games_played_by_coach.transform_values {|value| value.select {|game| game.result == "WIN"}}.transform_values {|value| value.count}
    avg = number_of_games_coached.merge(games_won){|key, games_played, games_won| games_won.to_f / games_played.to_f}
    coach_name = avg.key(avg.values.min)
  end

  def accuracy(game_teams)
    total_goals = game_teams.map{|game_team| game_team.goals}.sum.to_f
    total_shots = game_teams.map{|game_team| game_team.shots.to_i}.sum.to_f
    accuracy = total_goals/total_shots
  end

  def most_accurate_team(season)
    most_accurate = nil
    best_accuracy = 0.01
    games_teams_in_season = games_played_in_season(season)
    games_team_by_team = games_teams_in_season.group_by{|game_team| game_team.team_id}
    games_team_by_team.each do |team_id, game_teams|
      team_accuracy = accuracy(game_teams)
      if team_accuracy >= best_accuracy.to_f
        (best_accuracy = team_accuracy) && (most_accurate = team_id)
      end
    end
    team_info(most_accurate)["team_name"]
  end

  def least_accurate_team(season)
    least_accurate = nil
    worst_accuracy = 1.00
    games_teams_in_season = games_played_in_season(season)
    games_team_by_team = games_teams_in_season.group_by{|game_team| game_team.team_id}
    games_team_by_team.each do |team_id, game_teams|
      team_accuracy = accuracy(game_teams)
      if team_accuracy <= worst_accuracy.to_f
        (worst_accuracy = team_accuracy) && (least_accurate = team_id)
      end
    end
    team_info(least_accurate)["team_name"]
  end

  def most_tackles(season)
    team_tackles_totals = game_stats_by_team_id(season).transform_values{|values| values.map{|game_teams| game_teams.tackles.to_i}.inject(:+)}
    team_id = team_tackles_totals.key(team_tackles_totals.values.max)
    team_info(team_id)["team_name"]
  end

  def fewest_tackles(season)
    team_tackles_totals = game_stats_by_team_id(season).transform_values{|values| values.map{|game_teams| game_teams.tackles.to_i}.inject(:+)}
    team_id = team_tackles_totals.key(team_tackles_totals.values.min)
    team_info(team_id)["team_name"]
  end
end
