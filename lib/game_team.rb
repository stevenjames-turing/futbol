class GameTeam
  attr_reader :game_id,
              :team_id,
              :hoa,
              :result,
              :settled_in,
              :head_coach,
              :goals,
              :shots,
              :tackles,
              :pim,
              :powerplayopportunities,
              :powerplaygoals,
              :faceoffwinwercentage,
              :giveaways,
              :takeaways

  def initialize(stats)
    @game_id = stats[:game_id]
    @team_id = stats[:team_id]
    @hoa = stats[:hoa]
    @result = stats[:result]
    @settled_in = stats[:settled_in]
    @head_coach = stats[:head_coach]
    @goals = stats[:goals]
    @shots = stats[:shots]
    @tackles = stats[:tackles]
    @pim = stats[:pim]
    @powerplayopportunities = stats[:powerplayopportunities]
    @powerplaygoals = stats[:powerplaygoals]
    @faceoffwinwercentage = stats[:faceoffwinwercentage]
    @giveaways = stats[:giveaways]
    @takeaways = stats[:takeaways]
  end
end
