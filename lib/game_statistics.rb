#Pseudo
#methods called by stat stacker

#highest_total_score : iterate through games. if sum of both scores higher than current high, set equal to current high

#lowest_total_score : iterate through games. if sum of both scores lower than current low, set equal to current high

#percentage_home_wins: iterate through games. If home won, home wins +=1 . return home wins / total games
require "csv"
module GameStatistics
  #row[:symbol] will just be row.symbol
  def highest_total_score
    most_goals = 0
    @games_data.each do |row|
      total_goals= (row[:home_goals].to_i)+(row[:away_goals].to_i)
      if total_goals > most_goals
        most_goals = total_goals
      end
    end
    return most_goals
  end

  def lowest_total_score

    least_goals = 10
    @games_data.each do |row|
      total_goals= (row[:home_goals].to_i)+(row[:away_goals].to_i)
      if total_goals < least_goals
        least_goals = total_goals
      end
    end
    return least_goals
  end

  def percentage_home_wins
    home_wins = 0.0
    total_games = 0.0
    @games_data.each do |row|
      total_games += 1
      if ((row[:home_goals])>(row[:away_goals]))
        home_wins += 1
      end
    end
    percent_home_wins = home_wins/total_games
  end

  def percentage_visitor_wins
    away_wins = 0.0
    total_games = 0.0
    @games_data.each do |row|
      total_games += 1
      if ((row[:home_goals])<(row[:away_goals]))
        away_wins += 1
      end
    end
    percent_away_wins = away_wins/total_games
  end

  def percentage_ties
    ties = 0.0
    total_games = 0.0
    @games_data.each do |row|
      total_games += 1
      if ((row[:home_goals])==(row[:away_goals]))
        ties += 1
      end
    end
    percent_away_wins = ties/total_games
  end

  def count_of_games_by_season #games:season
    count_of_games_by_season = {}
    @games_data.each do |row|
      count_of_games_by_season[row[:season]] = 0
    end
    @games_data.each do |row|
      count_of_games_by_season[row[:season]] += 1
    end
    return count_of_games_by_season
  end

  def average_goals_per_game
  end

  def average_goals_by_season
  end
end
