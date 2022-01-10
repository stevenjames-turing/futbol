module GameStatistics

  def total_games
    total_games = 0.0
    @games_data.each do |row|
      total_games += 1
    end
    return total_games
  end

  def highest_total_score
    most_goals = 0
    @games_data.each do |row|
      total_goals= (row.home_goals.to_i)+(row.away_goals.to_i)
      if total_goals > most_goals
        most_goals = total_goals
      end
    end
    return most_goals
  end

  def lowest_total_score
    least_goals = 10
    @games_data.each do |row|
      total_goals= (row.home_goals.to_i)+(row.away_goals.to_i)
      if total_goals < least_goals
        least_goals = total_goals
      end
    end
    return least_goals
  end

  def percentage_home_wins
    home_wins = 0.0
    @games_data.each do |row|
      if ((row.home_goals)>(row.away_goals))
        home_wins += 1
      end
    end
    percent_home_wins = home_wins/self.total_games
    return percent_home_wins.round(2)
  end

  def percentage_visitor_wins
    away_wins = 0.0
    @games_data.each do |row|
      if ((row.home_goals)<(row.away_goals))
        away_wins += 1
      end
    end
    percent_away_wins = away_wins/self.total_games
    return percent_away_wins.round(2)
  end

  def percentage_ties
    ties = 0.0
    @games_data.each do |row|
      if ((row.home_goals)==(row.away_goals))
        ties += 1
      end
    end
    percent_away_wins = ties/self.total_games
    return percent_away_wins.round(2)
  end

  def count_of_games_by_season 
    count_of_games_by_season = {}
    @games_data.each do |row|
      count_of_games_by_season[row.season] = 0
    end
    @games_data.each do |row|
      count_of_games_by_season[row.season] += 1
    end
    return count_of_games_by_season
  end

  def average_goals_per_game
    total_goals = 0.0
    @games_data.each do |row|
      total_goals = total_goals + (row.home_goals.to_f + row.away_goals.to_f)
    end
    average_goals_per_game = total_goals / self.total_games
    return average_goals_per_game.round(2)
  end

  def total_goals_by_season
    total_goals_by_season = {}
    @games_data.each do |row|
      total_goals_by_season[row.season] = 0
    end
    @games_data.each do |row|
      total_goals_by_season[row.season] += ((row.away_goals.to_i) + (row.home_goals.to_i))
    end
    return total_goals_by_season
  end

  def average_goals_by_season
    count_of_games_by_season = self.count_of_games_by_season
    average_goals_by_season = {}
    @games_data.each do |row|
      average_goals_by_season[row.season] = 0.0
    end
    total_goals_by_season = self.total_goals_by_season
    average_goals_by_season.each do |season, goals|
      average_goals_by_season[season] = (total_goals_by_season[season].to_f / count_of_games_by_season[season].to_f)
      average_goals_by_season[season] = average_goals_by_season[season].round(2)
    end
    return average_goals_by_season
  end
end
