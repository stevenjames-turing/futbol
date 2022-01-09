require "./lib/stat_tracker.rb"

RSpec.describe SeasonStats do
  before(:all) do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @season_stats = SeasonStats.from_csv(locations)
  end

   describe 'SeasonStats module methods' do
     describe '#winningest_coach' do
       it 'returns the name of the Coach with the best win percentage for the season'
       expect(stat_tracker.winningest_coach()).to eq()
      end
    end

    describe '#worst_coach' do
      it 'returns the name of the Coach with the worst win percentage for the season' do
        expect(stat_tracker.worst_coach()).to eq()
      end
    end

    describe '#most_accurate_team' do
    it 'returns the name of the Team with the best ration of shots to goals for the season' do
      expect(stat_tracker.most_accurate_team()).to eq()
      end
    end

    describe '#least_accurate_team' do
      it 'returns the name of the Team with the most ration of shots to goals for the season' do
        expect(stat_tracker.least_accurate_team()).to eq()
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
        expect(stat_tracker.most_tackles()).to eq()
      end
    end
    describe '#fewest_tackles' do
      it 'returns the name of the Team with the most tackles in the season' do
        expect(stat_tracker.fewest_tackles()).to eq()
      end
    end
  end
