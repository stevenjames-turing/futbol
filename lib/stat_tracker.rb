#files sent to from_csv from runner. from_csv creates new object with hash containing file locations
require "./lib/game_statistics.rb"
require_relative './team'
require_relative './team_statistics'

class StatTracker
  include GameStatistics
  include TeamStatistics


  def initialize(paths)
    @paths = paths
  end

  def self.from_csv(location)
    stat_tracker = StatTracker.new(location)
  end

  def load_team_data
    contents = CSV.read(@paths[:teams], headers: true, header_converters: :symbol)
  end

  def load_game_data
    contents = CSV.read(@paths[:games], headers: true, header_converters: :symbol)
  end

  def load_gameteam_data
    contents = CSV.read(@paths[:games], headers: true, header_converters: :symbol)
  end

  def team_count
    load_team_data.count
  end
  #calls method in game stats, passes games location to be accessed
  def highest_total_score
    GameStatistics.highest_total_score(@paths[:games])
  end
end
