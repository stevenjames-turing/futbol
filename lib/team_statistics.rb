module TeamStatistics

  def team_info(team_id)
    team_info_full = @teams_data.find do |row|
      row.team_id == team_id
    end
    team_info = {
      team_id: team_info_full.team_id,
      franchise_id: team_info_full.franchiseid,
      team_name: team_info_full.teamname,
      abbreviation: team_info_full.abbreviation,
      link: team_info_full.link}
    team_info
  end

  def best_season(team_id)
    seasons = []
    wins = find_outcome(team_id, "WIN")
    wins.each do |win|
      @games_data.each do |game|
        if (game.game_id == win.game_id) && (game.type == "Postseason")
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
        if (game.game_id == win.game_id) && (game.type == "Regular Season")
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
    (total_wins.to_f / total_games) * 100
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

  private
  def find_outcome(team_id, desired_result)
    @game_teams_data.select do |x|
      (x.team_id == team_id) && (x.result == desired_result) #|| (x.result == "TIE"))
    end
  end
end
