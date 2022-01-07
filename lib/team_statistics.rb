# require_relative './team'
# require_relative './game'
# require_relative './game_team'

module TeamStatistics

  def team_info(team_id)
    team_info_full = @teams_data.find do |row|
      row[:team_id] == team_id
    end
    team_info = {
      team_id: team_info_full[:team_id],
      franchise_id: team_info_full[:franchiseid],
      team_name: team_info_full[:teamname],
      abbreviation: team_info_full[:abbreviation],
      link: team_info_full[:link]}
    team_info
  end

  def team_win?(team_id, game_id)
    require "pry"; binding.pry
    
  end

end
