require 'simplecov'
SimpleCov.start
require './lib/stat_tracker'
require './lib/team_statistics'

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
      team_id: "26",
      franchise_id: "14",
      team_name: "FC Cincinnati",
      abbreviation: "CIN",
      link: "/api/v1/teams/26"
    }
    expect(@stat_tracker.team_info("26")).to eq(info)
  end

  it '#best_season' do
    expect(@stat_tracker.best_season("6")).to eq("20122013")
  end

  it '#worst_season' do
    expect(@stat_tracker.worst_season())
  end

  end
  it '#average_win_percentage' do
    expect(@stat_tracker.average_win_percentage("16")).to eq(50.0)
  end
  it '#most_goals_scored' do
    expect(@stat_tracker.most_goals_scored("16")).to eq(2)
  end

  it '#fewest_goals_scored' do
    expect(@stat_tracker.fewest_goals_scored("5")).to eq(0)
  end

  it '#favorite_opponent' do
    expect(@stat_tracker.favorite_opponent("6")).to eq("Houston Dynamo")
  end

  it 'has a #rival team' do
    expect(@stat_tracker.rival("3")).to eq("FC Dallas")
  end
end
