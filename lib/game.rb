class Game
  attr_reader :id,
              :season,
              :type,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals,
              :venue

  def initialize(params)
    @id           = params["game_id"]
    @season       = params["season"]
    @type         = params["type"]
    @away_team_id = params["away_team_id"]
    @home_team_id = params["home_team_id"]
    @away_goals   = params["away_goals"].to_i
    @home_goals   = params["home_goals"].to_i
    @venue        = params["venue"]
  end
end
