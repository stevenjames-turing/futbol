require 'csv'
module StatsData

  attr_reader :games_data, :teams_data, :game_teams_data

  def initialize(file_paths)
    # @games_data = file_paths[:games]
    @games_data = CSV.read file_paths[:games], headers: true, header_converters: :symbol
    # @teams_data = file_paths[:teams]
    @teams_data = CSV.read file_paths[:teams], headers: true, header_converters: :symbol
    # @game_teams_data = file_paths[:game_teams]
    @game_teams_data = CSV.read file_paths[:game_teams], headers: true, header_converters: :symbol
  end
end
