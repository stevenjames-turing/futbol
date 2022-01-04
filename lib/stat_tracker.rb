require 'csv'

class StatTracker
  include DataLoader

  attr_reader :games,
              :teams,
              :game_teams

  def initialize(files)
    @games= files[:games]
    @teams = files[:teams]
    @game_teams = files[:game_teams]
    require "pry"; binding.pry
  end
  def self.from_csv(locations)
    StatTracker.new(locations)
  end


end
