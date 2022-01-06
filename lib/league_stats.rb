require 'csv'
module LeagueStats

  def count_of_teams(data)
    contents = CSV.open data, headers: true, header_converters: :symbol
    teams = contents.map do |row|
      :team_id
    end.count
  end


end
