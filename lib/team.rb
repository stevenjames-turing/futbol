class Team
  attr_reader :id,
              :franchise_id,
              :name,
              :abbreviation,
              :stadium

  def initialize(params)
    @id           = params["team_id"]
    @franchise_id = params["franchiseId"]
    @name    = params["teamName"]
    @abbreviation = params["abbreviation"]
    @stadium      = params["Stadium"]
  end
end
