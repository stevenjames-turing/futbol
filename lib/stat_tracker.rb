#files sent to from_csv from runner. from_csv creates new object with hash containing file locations
require_relative './game_statistics'
require_relative './league_stats'
require_relative './stats_data'
require_relative './team'
require_relative './game'
require_relative './game_team'
require_relative './team_statistics'
require_relative './season_stats'

class StatTracker
  include GameStatistics
  include LeagueStats
  include StatsData
  include TeamStatistics
  include SeasonStats

  def self.from_csv(locations)
    stat_tracker = StatTracker.new(locations)
  end
end
