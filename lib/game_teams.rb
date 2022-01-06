class GameTeam
  attr_reader :game_id,
              :team_id,
              :h_o_a,
              :result,
              :head_coach,
              :goals,
              :shots,
              :tackles

  def initialize(info)
    @game_id = info['game_id']
    @team_id = info['team_id']
    @h_o_a = info['HoA']
    @result = info['result']
    @settled_in info['settled_in']
    @head_coach = info['head_coach']
    @goals = info['goals'].to_i
    @shots = info['shots'].to_i
    @tackles = info['tackles'].to_i
    @pim = info['pim'].to_i
    @power_play_opportunites = info['powerPlayOpportunities'].to_i
    @power_play_goals = info['powerPlayGoals'].to_i
    @face_off_win_percentage = info['faceOffWinPercentage'].to_f
    @giveaways = info['giveaways'].to_i
    @takeaways = info['takeaways'].to_i 
  end
