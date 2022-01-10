 require 'simplecov'
 SimpleCov.start
 require "./lib/stat_tracker.rb"
 require "./lib/season_stats.rb"

RSpec.describe SeasonStats do
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

    # 'SeasonStats module methods'
     describe '#winningest_coach' do
       it 'returns the name of the Coach with the best win percentage for the season'
       expect(stat_tracker.winningest_coach("20122013")).to eq("Claude Julien")
      end

    describe '#worst_coach' do
      it 'returns the name of the Coach with the worst win percentage for the season' do
        expect(stat_tracker.worst_coach("20122013")).to eq("John Tortrella")
      end
    end

    describe '#most_accurate_team' do
    it 'returns the name of the Team with the best ration of shots to goals for the season' do
      expect(stat_tracker.most_accurate_team("20122013")).to eq("LA Galaxy")
      end
    end

    describe '#least_accurate_team' do
      it 'returns the name of the Team with the most ration of shots to goals for the season' do
        expect(stat_tracker.least_accurate_team("20122013")).to eq("Seattle Sounders FC")
      end
    end

    it '#games_played_in_season' do
      expect(stat_tracker.games_played_in_season("20122013")).to be_a(Array)
    end

    it 'game_stats_by_team_id' do
      expect(season_stats.game_stats_by_team_id("20122013")).to be_a(Hash)
    end

    describe '#most_tackles' do
      it 'returns the name of the Team with the most tackles in the season' do
        expect(stat_tracker.most_tackles("20122013")).to eq("FC Dallas")
      end
    end
    describe '#fewest_tackles' do
      it 'returns the name of the Team with the most tackles in the season' do
        expect(stat_tracker.fewest_tackles("20122013")).to eq("LA Gala")
      end
    end
  end
