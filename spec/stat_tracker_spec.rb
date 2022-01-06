require 'simplecov'
SimpleCov.start
require './lib/stat_tracker'

RSpec.describe StatTracker do
  # before(:each) do
  #
  #   stat_tracker = StatTracker.from_csv(locations)
  # end

  it "exists" do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    stat_tracker = StatTracker.from_csv(locations)
    expect(stat_tracker).to be_instance_of(StatTracker)
  end

  it 'can count the number of teams in the data' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path}
    stat_tracker = StatTracker.from_csv(locations)
    expect(stat_tracker.count_of_teams).to eq(32)
  end

  it 'can create a hash with team_id as keys and a nested hash with goal data' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path}
    stat_tracker = StatTracker.from_csv(locations)
    expected_data_as_keys = [:team_name, :goals_while_away, :goals_while_home, :total_goals, :away_games_played, :home_games_played, :total_games_played, :avg_goals_per_game_away, :avg_goals_per_game_home, :avg_goals_per_game_total]
    expect(stat_tracker.goal_data_by_team.keys.count).to eq(32)
    expect(stat_tracker.goal_data_by_team.values_at("3")[0].keys).to eq(expected_data_as_keys)
  end

  it 'can return the name of the team with the HIGHEST average number of goals scored per game across all seasons' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path}
    stat_tracker = StatTracker.from_csv(locations)
    expect(stat_tracker.best_offense).to eq("Reign FC")
  end

  it 'can return the name of the team with the LOWEST average number of goals scored per game across all seasons' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path}
    stat_tracker = StatTracker.from_csv(locations)
    expect(stat_tracker.worst_offense).to eq("Utah Royals FC")
  end

  it 'can return the name of the team with the HIGHEST average score per game across all seasons when they are away' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path}
    stat_tracker = StatTracker.from_csv(locations)
    expect(stat_tracker.highest_scoring_visitor).to eq("FC Dallas")
  end

  it 'can return the name of the team with the HIGHEST average score per game across all seasons when they are home' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path}
    stat_tracker = StatTracker.from_csv(locations)
    expect(stat_tracker.highest_scoring_home_team).to eq("Reign FC")
  end

  it 'can return the name of the team with the LOWEST average score per game across all seasons when they are a visitor' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path}
      stat_tracker = StatTracker.from_csv(locations)
      expect(stat_tracker.lowest_scoring_visitor).to eq("San Jose Earthquakes")
    end

  it 'can return the name of the team with the LOWEST average score per game across all seasons when they are home' do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path}
      stat_tracker = StatTracker.from_csv(locations)
      expect(stat_tracker.lowest_scoring_home_team).to eq("Utah Royals FC")
  end
end
