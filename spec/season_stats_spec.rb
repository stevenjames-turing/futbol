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

    @stat_tracker = StatTracker.from_csv(locations)
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
    
  end
