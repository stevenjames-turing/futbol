require 'csv'
module StatsData

  attr_reader :games_data, :teams_data, :game_teams_data, :goals_per_team

  def initialize(file_paths)
    @games_data = make_objects(file_paths[:games], Game)
    @teams_data = make_objects(file_paths[:teams], Team)
    @game_teams_data = make_objects(file_paths[:game_teams], GameTeam)
    @goals_per_team = Hash.new{0}
  end

  def make_objects(filenames, object)
    objects = []
    CSV.foreach(filenames, headers: true, header_converters: :symbol) do |row|
      new_object = object.new(row)
      objects << new_object
    end
    objects
  end
end
