module TeamStatistics

  def team_info(team_id)
    team_info_full = @teams_data.find do |row|
      row.team_id == team_id
    end
    team_info = {
      "team_id" => team_info_full.team_id,
      "franchise_id" => team_info_full.franchiseid,
      "team_name" => team_info_full.teamname,
      "abbreviation" => team_info_full.abbreviation,
      "link" => team_info_full.link}
    team_info
  end

  def best_season(team_id)
    seasons = []
    wins = find_outcome(team_id, "LOSS")
    wins.each do |win|
      @games_data.each do |game|
        if (game.game_id == win.game_id)
          seasons << game.season
        end
      end
    end
    best_season = seasons.max_by{|season| seasons.count(season)}
  end

  def worst_season(team_id)
    seasons = []
    wins = find_outcome(team_id, "WIN")
    wins.each do |win|
      @games_data.each do |game|
        if (game.game_id == win.game_id)
          seasons << game.season
        end
      end
    end
    worst_season = seasons.max_by{|season| seasons.count(season)}
  end

  def average_win_percentage(team_id)
    total_wins = @game_teams_data.count do |game|
      game.team_id == team_id && game.result == "WIN"
    end
    total_games = @game_teams_data.count do |game|
      game.team_id == team_id
    end
    (total_wins.to_f / total_games).round(2)
  end

  def most_goals_scored(team_id)
    @game_teams_data.max_by do |game|
      game.team_id == team_id ? game.goals : 0
    end.goals
  end

  def fewest_goals_scored(team_id)
    @game_teams_data.select do |game|
      game.team_id == team_id
    end.min_by {|team| team.goals}.goals
  end

  def favorite_opponent(team_id)
    opponents = {}
    best_win_percentage = 0.01
    favorite_opponent = nil
    @games_data.each do |game|
      if (game.home_team_id == team_id) && (!opponents.has_key?(game.away_team_id))
        opponents[game.away_team_id] = {wins: 0, losses: 0, ties: 0, games_played: 0, win_percentage: 0}
        if game.home_goals > game.away_goals
          (opponents[game.away_team_id][:wins] += 1) && opponents[game.away_team_id][:games_played] += 1
        elsif game.home_goals == game.away_goals
          (opponents[game.away_team_id][:ties] += 1) && opponents[game.away_team_id][:games_played] += 1
        elsif game.home_goals < game.away_goals
          (opponents[game.away_team_id][:losses] += 1) && opponents[game.away_team_id][:games_played] += 1
        end
      elsif (game.home_team_id == team_id) && (opponents.has_key?(game.away_team_id))
        if game.home_goals > game.away_goals
          (opponents[game.away_team_id][:wins] += 1) && opponents[game.away_team_id][:games_played] += 1
        elsif game.home_goals == game.away_goals
          (opponents[game.away_team_id][:ties] += 1) && opponents[game.away_team_id][:games_played] += 1
        elsif game.home_goals < game.away_goals
          (opponents[game.away_team_id][:losses] += 1) && opponents[game.away_team_id][:games_played] += 1
        end
      end
      if (game.away_team_id == team_id) && (!opponents.has_key?(game.home_team_id))
        opponents[game.home_team_id] = {wins: 0, losses: 0, ties: 0, games_played: 0, win_percentage: 0}
        if game.away_goals > game.home_goals
          (opponents[game.home_team_id][:wins] += 1) && opponents[game.home_team_id][:games_played] += 1
      elsif game.away_goals == game.home_goals
          (opponents[game.home_team_id][:ties] += 1) && opponents[game.home_team_id][:games_played] += 1
        elsif game.away_goals < game.home_goals
          (opponents[game.home_team_id][:losses] += 1) && opponents[game.home_team_id][:games_played] += 1
        end
      elsif (game.home_team_id == team_id) && (opponents.has_key?(game.home_team_id))
        if game.away_goals > game.home_goals
          (opponents[game.home_team_id][:wins] += 1) && opponents[game.home_team_id][:games_played] += 1
        elsif game.away_goals == game.home_goals
          (opponents[game.home_team_id][:ties] += 1) && opponents[game.home_team_id][:games_played] += 1
        elsif game.away_goals < game.home_goals
          (opponents[game.home_team_id][:losses] += 1) && opponents[game.home_team_id][:games_played] += 1
        end
      end
    end
    opponents.each_pair do |id, stats|
      stats[:win_percentage] = stats[:wins].fdiv(stats[:games_played])
      if stats[:win_percentage] > best_win_percentage
        (best_win_percentage = stats[:win_percentage]) && (favorite_opponent = id)
      end
    end
    team_info(favorite_opponent)["team_name"]
  end

  def rival(team_id)
    opponents = {}
    worst_win_percentage = 1.00
    rival = nil
    @games_data.each do |game|
      if (game.home_team_id == team_id) && (!opponents.has_key?(game.away_team_id))
        opponents[game.away_team_id] = {wins: 0, losses: 0, ties: 0, games_played: 0, win_percentage: 0}
        if game.home_goals > game.away_goals
          (opponents[game.away_team_id][:wins] += 1) && opponents[game.away_team_id][:games_played] += 1
        elsif game.home_goals == game.away_goals
          (opponents[game.away_team_id][:ties] += 1) && opponents[game.away_team_id][:games_played] += 1
        elsif game.home_goals < game.away_goals
          (opponents[game.away_team_id][:losses] += 1) && opponents[game.away_team_id][:games_played] += 1
        end
      elsif (game.home_team_id == team_id) && (opponents.has_key?(game.away_team_id))
        if game.home_goals > game.away_goals
          (opponents[game.away_team_id][:wins] += 1) && opponents[game.away_team_id][:games_played] += 1
        elsif game.home_goals == game.away_goals
          (opponents[game.away_team_id][:ties] += 1) && opponents[game.away_team_id][:games_played] += 1
        elsif game.home_goals < game.away_goals
          (opponents[game.away_team_id][:losses] += 1) && opponents[game.away_team_id][:games_played] += 1
        end
      end
      if (game.away_team_id == team_id) && (!opponents.has_key?(game.home_team_id))
        opponents[game.home_team_id] = {wins: 0, losses: 0, ties: 0, games_played: 0, win_percentage: 0}
        if game.away_goals > game.home_goals
          (opponents[game.home_team_id][:wins] += 1) && opponents[game.home_team_id][:games_played] += 1
      elsif game.away_goals == game.home_goals
          (opponents[game.home_team_id][:ties] += 1) && opponents[game.home_team_id][:games_played] += 1
        elsif game.away_goals < game.home_goals
          (opponents[game.home_team_id][:losses] += 1) && opponents[game.home_team_id][:games_played] += 1
        end
      elsif (game.home_team_id == team_id) && (opponents.has_key?(game.home_team_id))
        if game.away_goals > game.home_goals
          (opponents[game.home_team_id][:wins] += 1) && opponents[game.home_team_id][:games_played] += 1
        elsif game.away_goals == game.home_goals
          (opponents[game.home_team_id][:ties] += 1) && opponents[game.home_team_id][:games_played] += 1
        elsif game.away_goals < game.home_goals
          (opponents[game.home_team_id][:losses] += 1) && opponents[game.home_team_id][:games_played] += 1
        end
      end
    end
    opponents.each_pair do |id, stats|
      stats[:win_percentage] = stats[:wins].fdiv(stats[:games_played])
      if stats[:win_percentage] < worst_win_percentage
        (worst_win_percentage = stats[:win_percentage]) && (rival = id)
      end
    end
    team_info(rival)["team_name"]
  end

  # def favorite_opponent(team_id)
  #   games_won = @games_data.select do |game|
  #     game.home_team_id == team_id && game.home_goals > game.away_goals ||
  #     game.away_team_id == team_id && game.away_goals > game.home_goals
  #   end
  #   opponents = []
  #   games_won.select do |game|
  #     if game.home_team_id == team_id
  #       opponents << game.away_team_id
  #     elsif game.away_team_id == team_id
  #       opponents << game.home_team_id
  #     end
  #   end
  #   opponent_name = opponents.max_by do |x|
  #     x.size
  #   end
  #   team_info(opponent_name)[:team_name]
  # end
  #
  # def rival(team_id)
  #   games_lost = @games_data.select do |game|
  #     game.home_team_id == team_id && game.away_goals > game.home_goals ||
  #     game.away_team_id == team_id && game.home_goals > game.away_goals
  #   end
  #   rivals = []
  #   games_lost.select do |game|
  #     if game.home_team_id == team_id
  #       rivals << game.away_team_id
  #     elsif game.away_team_id == team_id
  #       rivals << game.home_team_id
  #     end
  #   end
  #   rival_name = rivals.max_by do |x|
  #     x.size
  #   end
  #   team_info(rival_name)[:team_name]
  # end

  private
  def find_outcome(team_id, desired_result)
    @game_teams_data.select do |x|
      (x.team_id == team_id) && (x.result != desired_result) #|| (x.result == "TIE"))
    end
  end
end
