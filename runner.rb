require './lib/stat_tracker'

game_path = './data/games.csv'
team_path = './data/teams.csv'
game_teams_path = './data/game_teams.csv'

# game_path = './data/test_games.csv'
# team_path = './data/test_teams.csv'
# game_teams_path = './data/test_game_teams.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

stat_tracker = StatTracker.from_csv(locations)

p stat_tracker.count_of_teams
p stat_tracker.best_offense
p stat_tracker.worst_offense
p stat_tracker.highest_scoring_visitor
p stat_tracker.highest_scoring_home_team
p stat_tracker.lowest_scoring_visitor
p stat_tracker.lowest_scoring_home_team
p stat_tracker.team_info("18")
p stat_tracker.best_season("6")
p stat_tracker.worst_season("6")
p stat_tracker.average_win_percentage("6")
p stat_tracker.most_goals_scored("18")
p stat_tracker.fewest_goals_scored("18")
p stat_tracker.favorite_opponent("18")
p stat_tracker.rival("18")
p stat_tracker.winningest_coach("20122013")
p stat_tracker.winningest_coach("20142015")
p stat_tracker.worst_coach("20122013")
p stat_tracker.worst_coach("20142015")
p stat_tracker.most_accurate_team("20122013")
p stat_tracker.most_accurate_team("20142015")
p stat_tracker.least_accurate_team("20122013")
p stat_tracker.least_accurate_team("20132014")
p stat_tracker.least_accurate_team("20142015")
p stat_tracker.most_tackles("20122013")
p stat_tracker.most_tackles("20132014")
p stat_tracker.most_tackles("20142015")
p stat_tracker.fewest_tackles("20122013")
p stat_tracker.fewest_tackles("20132014")
p stat_tracker.fewest_tackles("20142015")

# require 'pry'; binding.pry
