require 'simplecov'
SimpleCov.start
require './data_loader'
require './lib/stat_tracker'

RSpec.describe StatTracker do
  describe 'initializion' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    stat_tracker = StatTracker.new(locations)
    stat_tracker = StatTracker.from_csv(locations)

    it 'exists' do
      expect(stat_tracker).to be_instance_of(StatTracker)
    end

    it 'can sort the loaded data' do


    end
  end
end
