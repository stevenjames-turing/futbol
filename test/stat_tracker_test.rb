require './test/test_helper'
require './lib/stat_tracker'

class StatTrackerTest < Minitest::Test
  def setup
    game_path = './test/fixtures/games.csv'
    team_path = './test/fixtures/teams.csv'
    game_teams_path = './test/fixtures/game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_it_has_games
    game = @stat_tracker.games.first
    assert_instance_of Game, game
    assert_equal '20122013', game.season
    assert_equal 'Postseason', game.type
    assert_equal '3', game.away_team_id
    assert_equal '6', game.home_team_id
    assert_equal 2, game.away_goals
    assert_equal 3, game.home_goals
    assert_equal 'Toyota Stadium', game.venue
  end

  def test_it_has_teams
    team = @stat_tracker.teams['2']
    assert_instance_of Team, team
    assert_equal 'Seattle Sounders FC', team.name
    assert_equal 'SEA', team.abbreviation
  end

  def test_it_has_game_teams
    game_team = @stat_tracker.game_teams.first
    assert_instance_of GameTeam, game_team
    assert_equal '2012030221', game_team.game_id
    assert_equal '3', game_team.team_id
    assert_equal 'away', game_team.hoa
    assert_equal 'LOSS', game_team.result
    assert_equal 'John Tortorella', game_team.head_coach
    assert_equal 2, game_team.goals
    assert_equal 8, game_team.shots
    assert_equal 44, game_team.tackles
  end
end
