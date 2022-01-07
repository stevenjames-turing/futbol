require './lib/stat_tracker.rb'

RSpec.describe StatTracker do
  include TeamStatistics
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

  it "exists" do
    expect(@stat_tracker).to be_instance_of(StatTracker)
  end

  xit 'can load team data' do
    expect(@stat_tracker.make_teams).to_not eq(false)
  end

  xit 'can count the number of teams' do
    expect(@stat_tracker.team_count).to eq(32)
  end
end
