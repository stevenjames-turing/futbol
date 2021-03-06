require "./lib/game_statistics.rb"
require "./lib/stat_tracker.rb"

RSpec.describe GameStatistics do
  before(:all) do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

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

  it "finds total games" do

  expect(@stat_tracker.total_games).to eq(7441)
  end

  it "finds highest total score" do

  expect(@stat_tracker.highest_total_score).to be_instance_of(Integer)
  end

  it "finds lowest total score" do

  expect(@stat_tracker.lowest_total_score).to be_instance_of(Integer)
  end

  it "finds percentage home wins" do

  expect(@stat_tracker.percentage_home_wins).to be_instance_of(Float)
  end

  it "finds percentage visitor wins" do
    expect(@stat_tracker.percentage_visitor_wins).to be_instance_of(Float)
  end

  it "finds percentage ties" do
    expect(@stat_tracker.percentage_visitor_wins).to be_instance_of(Float)
  end

  it "finds games per season" do
    expect(@stat_tracker.count_of_games_by_season).to be_instance_of(Hash)
  end

  it "finds total goals per season" do
    expect(@stat_tracker.total_goals_by_season).to be_instance_of(Hash)
  end

  it "finds average goals per season" do
    expect(@stat_tracker.average_goals_by_season).to be_instance_of(Hash)
  end
end
