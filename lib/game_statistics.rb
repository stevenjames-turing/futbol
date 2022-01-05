#Pseudo
#methods called by stat stacker

#highest_total_score : iterate through games. if sum of both scores higher than current high, set equal to current high

#lowest_total_score : iterate through games. if sum of both scores lower than current low, set equal to current high

#percentage_home_wins: iterate through games. If home won, home wins +=1 . return home wins / total games
require "csv"
module GameStatistics

  def highest_total_score(games)
    contents = CSV.open games, headers: true, header_converters: :symbol
    most_goals = 0
    contents.each do |row|
      total_goals= (row[:home_goals].to_i)+(row[:away_goals].to_i)
      if total_goals > most_goals
        most_goals = total_goals
      end
    end

    return most_goals
  end

end
