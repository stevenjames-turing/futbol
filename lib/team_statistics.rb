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
    wins = @game_teams_data.select do |game_team|
      (game_team.team_id == team_id) && (game_team.result != "LOSS")
    end
    wins.each do |win|
      @games_data.each do |game|
        if (game.game_id == win.game_id)
          seasons << game.season
        end
      end
    end
    worst_season = seasons.max_by{|season| seasons.count(season)}
  end

  def worst_season(team_id)
    seasons = []
    wins = @game_teams_data.select do |game_team|
      (game_team.team_id == team_id) && (game_team.result != "WIN")
    end
    wins.each do |win|
      @games_data.each do |game|
        if (game.game_id == win.game_id)
          seasons << game.season
        end
      end
    end
    worst_season = seasons.max_by{|season| seasons.count(season)}
  end
end
