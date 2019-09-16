class GameTeam
  attr_reader :game_id,
              :team_id,
              :hoa,
              :result,
              :head_coach,
              :goals,
              :shots,
              :tackles

  def initialize(params)
    @game_id    = params["game_id"]
    @team_id    = params["team_id"]
    @hoa        = params["HoA"]
    @result     = params["result"]
    @head_coach = params["head_coach"]
    @goals      = params["goals"].to_i
    @shots      = params["shots"].to_i
    @tackles    = params["tackles"].to_i
  end
end
