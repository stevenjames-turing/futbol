module TeamStatistics

  def team_info(team_id)
    x = load_team_data.find do |team|
      team[:team_id] == team_id
    end
    team_info = {
      # team_id: x.team_id
      franchiseid: x.franchiseid
    }
  end
end
 
