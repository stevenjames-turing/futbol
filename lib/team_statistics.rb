require_relative './team'

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
end
