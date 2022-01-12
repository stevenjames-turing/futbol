require 'simplecov'
SimpleCov.start
require './lib/game'

RSpec.describe Game do

    it 'exists' do
      stats = {
        game_id: "2012030222",
        season: "20122013",
        type: "Postseason",
        date_time: "5/19/13",
        away_team_id: "3",
        home_team_id: "6",
        away_goals: "2",
        home_goals: "3",
        venue: "Toyota Stadium",
        venue_link: "/api/v1/venues/null"
      }
      game = Game.new(stats)
      expect(game).to be_a(Game)
    end

    it 'has game stats' do
      stats = {
        game_id: "2012030222",
        season: "20122013",
        type: "Postseason",
        date_time: "5/19/13",
        away_team_id: "3",
        home_team_id: "6",
        away_goals: "2",
        home_goals: "3",
        venue: "Toyota Stadium",
        venue_link: "/api/v1/venues/null"
      }
      game = Game.new(stats)
      expect(game.game_id).to eq("2012030222")
      expect(game.season).to eq("20122013")
      expect(game.type).to eq("Postseason")
      expect(game.date_time).to eq("5/19/13")
      expect(game.away_team_id).to eq("3")
      expect(game.home_team_id).to eq("6")
      expect(game.away_goals).to eq("2")
      expect(game.home_goals).to eq("3")
      expect(game.venue).to eq("Toyota Stadium")
      expect(game.venue_link).to eq("/api/v1/venues/null")
    end
end
