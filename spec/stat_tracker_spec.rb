require 'simplecov'
SimpleCov.start
require './lib/stat_tracker'

RSpec.describe StatTracker do
  before(:all) do
    # game_path = './data/test_games.csv'
    # team_path = './data/test_teams.csv'
    # game_teams_path = './data/test_game_teams.csv'

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

  it 'can count the number of teams in the data' do
    expect(@stat_tracker.count_of_teams).to eq(32)
  end

  it 'initializes with an empty hash as @goals_per_team data' do
    expect(@stat_tracker.goals_per_team).to eq({})
  end

  it 'can add home team goal data to goals_per_team hash' do
    @stat_tracker.goal_data_by_home_team
    expect(@stat_tracker.goals_per_team.values).to_not eq nil
  end

  it 'can add away team goal data to goals_per_team hash' do
    @stat_tracker.goal_data_by_away_team
    expect(@stat_tracker.goals_per_team.values).to_not eq nil
  end

  it 'can create a hash with team_id as keys and a nested hash with goal data' do
    expected_data_as_keys = [:goals_while_away, :goals_while_home, :total_goals, :away_games_played, :home_games_played, :total_games_played, :team_name, :avg_goals_per_game_total, :avg_goals_per_game_away, :avg_goals_per_game_home]
    expect(@stat_tracker.goal_data_by_team.keys.count).to eq(32)
    expect(@stat_tracker.goal_data_by_team.values_at("3")[0].keys).to eq(expected_data_as_keys)
  end

  it 'can return the name of the team with the HIGHEST average number of goals scored per game across all seasons' do
    expect(@stat_tracker.best_offense).to eq("Reign FC")
  end

  it 'can return the name of the team with the LOWEST average number of goals scored per game across all seasons' do
    expect(@stat_tracker.worst_offense).to eq("Utah Royals FC")
  end

  it 'can return the name of the team with the HIGHEST average score per game across all seasons when they are away' do
    expect(@stat_tracker.highest_scoring_visitor).to eq("FC Dallas")
  end

  it 'can return the name of the team with the HIGHEST average score per game across all seasons when they are home' do
    expect(@stat_tracker.highest_scoring_home_team).to eq("Reign FC")
  end

  it 'can return the name of the team with the LOWEST average score per game across all seasons when they are a visitor' do
    expect(@stat_tracker.lowest_scoring_visitor).to eq("San Jose Earthquakes")
  end

  it 'can return the name of the team with the LOWEST average score per game across all seasons when they are home' do
    expect(@stat_tracker.lowest_scoring_home_team).to eq("Utah Royals FC")
  end

  it "#team_info" do
    expected = {
      "team_id" => "18",
      "franchise_id" => "34",
      "team_name" => "Minnesota United FC",
      "abbreviation" => "MIN",
      "link" => "/api/v1/teams/18"
    }

    expect(@stat_tracker.team_info("18")).to eq expected
  end

  it "#best_season" do
    expect(@stat_tracker.best_season("6")).to eq "20132014"
  end

  it "#worst_season" do #it is returing 20152016
    expect(@stat_tracker.worst_season("6")).to eq "20142015"
  end

  it "#average_win_percentage" do
    expect(@stat_tracker.average_win_percentage("6")).to eq 0.49
  end

  it "#most_goals_scored" do
    expect(@stat_tracker.most_goals_scored("18")).to eq 7
  end

  it "#fewest_goals_scored" do
    expect(@stat_tracker.fewest_goals_scored("18")).to eq 0
  end

  it "#favorite_opponent" do
    expect(@stat_tracker.favorite_opponent("18")).to eq "DC United"
  end

  it "#rival" do
    expect(@stat_tracker.rival("18")).to eq("Houston Dash").or(eq("LA Galaxy"))
  end
end
