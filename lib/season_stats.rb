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
    average_wins_by_coach(season).min_by{|coach, average_wins| average_wins}[0]
  end

  def worst_coach(season)
    games_played_in_season(season)
    games_played_by_coach = games_played_in_season(season).group_by {|game| game.head_coach}
    number_of_games_coached = games_played_by_coach.transform_values {|value| value.count}
    games_won = games_played_by_coach.transform_values {|value| value.select {|game| game.result == "WIN"}}.transform_values {|value| value.count}
    avg = number_of_games_coached.merge(games_won){|key, games_played, games_won| games_won.to_f / games_played.to_f}
    coach_name = avg.key(avg.values.min)
  end

  def most_accurate_team(season)
    games_teams_in_season = games_played_in_season(season)
    games_team_by_team = game_stats_by_team_id(season)
    goals_by_team_array = games_team_by_team.map {|key, game| game.map {|stat| stat.goals.to_f}}
    total_goals = goals_by_team_array.map {|goal| goal.sum}
    shots_by_team_array = games_team_by_team.map {|key, game| game.map {|stat| stat.shots.to_f}}
    total_shots = shots_by_team_array.map {|shot| shot.sum}

    team_id_array = games_teams_in_season.map {|game| game.team_id}.uniq

    ratios_array = total_goals.zip(total_shots).map {|item| item.inject(:/)}
    ratios_by_team = Hash[team_id_array.zip(ratios_array)]
    max_ratio = ratios_by_team.key(ratios_by_team.values.max)

    team_name_id(max_ratio)
  end

  def least_accurate_team(season)
    games_teams_in_season = games_played_in_season(season)
    games_team_by_team = game_stats_by_team_id(season)
    goals_by_team_array = games_team_by_team.map {|key, game| game.map {|stat| stat.goals.to_f}}
    total_goals = goals_by_team_array.map {|goal| goal.sum}
    shots_by_team_array = games_team_by_team.map {|key, game| game.map {|stat| stat.shots.to_f}}
    total_shots = shots_by_team_array.map {|shot| shot.sum}

    team_id_array = games_teams_in_season.map {|game| game.team_id}.uniq

    ratios_array = total_goals.zip(total_shots).map {|item| item.inject(:/)}
    ratios_by_team = Hash[team_id_array.zip(ratios_array)]
    min_ratio = ratios_by_team.key(ratios_by_team.values.min)

    team_name_id(min_ratio)
  end

  def team_name_id(team_id)
      @teams_data.select {|team| team.team_id == team_id}.map {|team| team.teamname}[0]
  end

  def most_tackles(season)
    team_tackles_totals = game_stats_by_team_id(season).transform_values{|values| values.map{|game_teams| game_teams.tackles.to_i}.inject(:+)}
    team_id = team_tackles_totals.key(team_tackles_totals.values.max)
    team_name_id(team_id)
  end

  def fewest_tackles(season)
    team_tackles_totals = game_stats_by_team_id(season).transform_values{|values| values.map{|game_teams| game_teams.tackles.to_i}.inject(:+)}
    team_id = team_tackles_totals.key(team_tackles_totals.values.min)
    team_name_id(team_id)
  end
end
