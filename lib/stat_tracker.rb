require_relative './game'
require_relative './team'
require_relative './game_team'
require 'csv'

class StatTracker
  attr_reader :games, :teams, :game_teams

  def initialize(games, teams, game_teams)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end

  def self.from_csv(locations)
    games = create_objects(locations[:games], Game)
    teams = create_objects(locations[:teams], Team)
    game_teams = create_objects(locations[:game_teams], GameTeam)

    new(games, teams, game_teams)
  end

  def self.create_objects(location, type)
    type == Team ? objects = {} : objects = []
    CSV.foreach(location, headers: true) do |row|
      obj = type.new(row)
      type == Team ? objects[obj.id] = obj : objects << obj
    end
    objects
  end
end
