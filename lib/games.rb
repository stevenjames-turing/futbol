require 'csv'
class Game
  attr_reader :game_id, :season, :away_team_id, :home_team_id, :away_goals, :home_goals

  def initialize(paths)
    @game_id      = paths[:game_id]
    @season       = paths[:season]
    @type         = paths[:type]
    @date_time    = paths[:date_time]
    @away_team_id = paths[:away_team_id]
    @home_team_id = paths[:home_team_id]
    @away_goals   = paths[:away_goals]
    @home_goals   = paths[:home_goals]
    @venue        = paths[:venue]
    @venue_link   = paths[:venue_link]

  end

end
