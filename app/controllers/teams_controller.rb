class TeamsController < ApplicationController
  before_action :set_team, except: [ :index ]

  def show
    @coaches =
  end

  def index
    @teams = Team.all
  end

  private

  def set_team
    Team.find(team_id = params[:id]) || @team = current_user.team
  end

end
