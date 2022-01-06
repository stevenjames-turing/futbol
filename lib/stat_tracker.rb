#files sent to from_csv from runner. from_csv creates new object with hash containing file locations
require "./lib/game_statistics.rb"
require './lib/league_stats'
include GameStatistics
include LeagueStats
class StatTracker


  def initialize(file_paths)
    @games_data = file_paths[:games]
    @teams_data = file_paths[:teams]
    @game_teams_data = file_paths[:game_teams]

  end

  def self.from_csv(location)
    stat_tracker = StatTracker.new(location)
  end

  #calls method in game stats, passes games location to be accessed
  def highest_total_score
    GameStatistics.highest_total_score(@games_data)
  end

  def count_of_teams
    LeagueStats.count_of_teams(@teams_data)
  end

  def best_offense
    LeagueStats.best_offense(@games_data, @teams_data)
  end

  def worst_offense
    LeagueStats.worst_offense(@games_data, @teams_data)
  end

  def highest_scoring_visitor
    LeagueStats.highest_scoring_visitor(@games_data, @teams_data)
  end

  def highest_scoring_home_team
    LeagueStats.highest_scoring_home_team(@games_data, @teams_data)
  end

  def lowest_scoring_visitor
    LeagueStats.lowest_scoring_visitor(@games_data, @teams_data)
  end

  def lowest_scoring_home_team
    LeagueStats.lowest_scoring_home_team(@games_data, @teams_data)
  end
end
