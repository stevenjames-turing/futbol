require 'simplecov'
SimpleCov.start
require './lib/stat_tracker'
require './lib/team_statistics'
require './lib/team'

RSpec.describe TeamStatistics do
  before(:all) do
    game_path = './data/test_games.csv'
    team_path = './data/test_teams.csv'
    game_teams_path = './data/test_game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)
  end

  it '#team_info' do
    info = {
      team_id: 26,
      franchise_id: "14",
      team_name: "FC Cincinnati",
      abbreviation: "CIN",
      link: "/api/v1/teams/26"
    }
    expect(@stat_tracker.team_info(26)).to eq(info)
  end

end
