require 'simplecov'
SimpleCov.start
require './lib/team'

RSpec.describe Team do

  it 'exists' do
    info = {
      team_id: 4,
      franchiseid: 16,
      teamname: "Chicago Fire",
      abbreviation: "CHI",
      stadium: "SeatGeek Stadium",
      link: "/api/v1/teams/4"
    }
    team = Team.new(info)
    expect(team).to be_a(Team)
  end

  it 'has team data' do
    info = {
      team_id: 4,
      franchiseid: 16,
      teamname: "Chicago Fire",
      abbreviation: "CHI",
      stadium: "SeatGeek Stadium",
      link: "/api/v1/teams/4"
    }
    team = Team.new(info)
    expect(team.team_id).to eq(4)
    expect(team.franchiseid).to eq(16)
    expect(team.teamname).to eq("Chicago Fire")
    expect(team.abbreviation).to eq("CHI")
    expect(team.stadium).to eq("SeatGeek Stadium")
    expect(team.link).to eq("/api/v1/teams/4")
  end
end
