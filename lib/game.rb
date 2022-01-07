class Game
  attr_reader :game_id,
              :season,
              :type,
              :date_time,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals,
              :venue,
              :venue_link

  def initialize(stats)
    @game_id = stats[:game_id]
    @season = stats[:season]
    @type = stats[:type]
    @date_time = stats[:date_time]
    @away_team_id = stats[:away_team_id]
    @home_team_id = stats[:home_team_id]
    @away_goals = stats[:away_goals]
    @home_goals = stats[:home_goals]
    @venue = stats[:venue]
    @venue_link = stats[:venue_link]
  end
end
