#files sent to from_csv from runner. from_csv creates new object with hash containing file locations
require "./lib/game_statistics.rb"
include GameStatistics
class StatTracker


  def initialize(paths)
    @paths = paths

  end

  def self.from_csv(location)
    stat_tracker = StatTracker.new(location)
  end

  #calls method in game stats, passes games location to be accessed
  def highest_total_score
    GameStatistics.highest_total_score(@paths[:games])
  end
end
