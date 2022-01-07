#files sent to from_csv from runner. from_csv creates new object with hash containing file locations
require "./lib/game_statistics.rb"
require './lib/league_stats'
require './lib/stats_data'
require_relative './team'
require_relative './team_statistics'

class StatTracker
  include GameStatistics
  include LeagueStats
  include StatsData
  include TeamStatistics

  def self.from_csv(locations)
    stat_tracker = StatTracker.new(locations)
  end

  #calls method in game stats, passes games location to be accessed
  def highest_total_score
    GameStatistics.highest_total_score(@games_data)
  end

  def percentage_visitor_wins
    GameStatistics.percentage_visitor_wins(@games)
  end

  def percentage_ties
    GameStatistics.percentage_ties(@games)
  end
end
