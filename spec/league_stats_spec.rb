require './lib/stat_tracker'
require './lib/league_stats'
require 'simplecov'
SimpleCov.start


RSpec.describe LeagueStats do
  # let () {}
  it 'exists' do
    league_stats = LeagueStats.new
    expect(league_stats).to be_instance_of LeagueStats
  end
end
