#files sent to from_csv from runner. from_csv creates new object with hash containing file locations
require "./lib/game_statistics.rb"
include GameStatistics
class StatTracker


  def initialize(paths)
    @paths = paths
    @games = @paths[:games]
    @teams = @paths[:teams]
    @game_teams = @paths[:game_teams]


  end

  def self.from_csv(location)
    stat_tracker = StatTracker.new(location)
  end

  #calls method in game stats, passes games location to be accessed
  def highest_total_score
    GameStatistics.highest_total_score(@games)
  end

  def lowest_total_score
    GameStatistics.lowest_total_score(@games)
  end

  def percentage_home_wins
    GameStatistics.percentage_home_wins(@games)
  end

  def percentage_visitor_wins
    GameStatistics.percentage_visitor_wins(@games)
  end

  def percentage_ties
    GameStatistics.percentage_ties(@games)
  end

end
