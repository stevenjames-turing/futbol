require_relative './team'

module TeamStatistics

  def team_info(team_id)
    teams_data = CSV.read @teams, headers: true, header_converters: :symbol
    team_info_full = teams_data.find do |row|
      row[:team_id].to_i == team_id
    end
    team_info = {
      team_id: team_info_full[:team_id].to_i,
      franchise_id: team_info_full[:franchiseid],
      team_name: team_info_full[:teamname],
      abbreviation: team_info_full[:abbreviation],
      link: team_info_full[:link]}
    team_info
  end

  # def team_info(team_id)
  #   team = @teams.find {|team| team[:team_id] == team_id}
  #   team_info = {
  #     team_id: team[:team_id],
  #     franchise_id: team[:franchiseid],
  #     team_name: team[:teamname],
  #     abbreviation: team[:abbreviation],
  #     link: team[:link]
  #   }
  # end
end



# end
# team_info = {
#   team_id: x.team_id,
#   franchiseid: x.franchiseid
# }
