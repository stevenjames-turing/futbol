module DataLoader

  def load_data
    contents = CSV.read(data_path, headers: true, header_converters: :symbol)
    contents.map do |row|
      self.new(row)
    end
  end

  def data_path
    if self == GameTeam
      path = 'data/game_teams.csv'
    elsif self == Game
      path = 'data/games.csv'
    elsif self == Team
      path = 'data/teams.csv'
    else
      puts "invalid file path"
    end
    path
  end
end
