require 'csv'
module StatsData

  attr_reader :games_data, :teams_data, :game_teams_data

  def initialize(file_paths)
    # @games_data = file_paths[:games]
    # @games_data = CSV.read file_paths[:games], headers: true, header_converters: :symbol
    @games_data = make_objects(file_paths[:games], Game)
    # @teams_data = file_paths[:teams]
    @teams_data = make_objects(file_paths[:teams], Team)
    # @game_teams_data = file_paths[:game_teams]
    @game_teams_data = make_objects(file_paths[:game_teams], GameTeam)
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
