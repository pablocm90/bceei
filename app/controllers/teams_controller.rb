class TeamsController < ApplicationController
  before_action :set_team

  def show

  end

  def index
    policy_scope(Team)
    @teams = Team.all
  end

  private

  def set_team
    @team = Team.find(current_player.team_id)
  end

end
