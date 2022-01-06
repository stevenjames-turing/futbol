require 'csv'
module SeasonStats

  def game_teams_by_coaches(season)
    game_teams_by_coach = games_teams_in_season(season).group_by { |game_teams| game_teams.head_coach}

  def average_wins_by_coach(season)
    average_percent_won_by_coaches = Hash.new
    game_teams_by_coaches(season).each do |coach, game_teams|
      total_wins_by_coach = game_teams.find_all{ |game_team| game_team.result == 'WIN'}.count.to_f
      average_percent_won_by_coaches[coach] = total_wins_by_coach / game_teams.count.to_f
    end
    average_percent_won_by_coaches
  end

  def winningest_coach(season)
    average_wins_by_coach(season_id).max_by{|coach, average_wins| average_wins}[0]
  end


    def worst_coach(season)
      average_wins_by_coach(season).max_by{|coach, average_wins| average_wins}[0]
    end

  end
