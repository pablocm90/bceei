class TeamsController < ApplicationController
  before_action :set_team
  attr_reader :coaches, :coaching_staff_functions

  def show
    authorize @team
    @coaches = coaches(@team)
    @players = @team.players_ordered

  end

  def index
    policy_scope(Team)
    @teams = Team.all
  end

  private

  def coaches(team)
    coaching_staff = {}
    coaching_staff[:head_coach] = Coach.where(coach_function_id: coaching_staff_functions(team)[0])
    coaching_staff[:assistants] = []
    coaching_staff_functions(team).drop(1).each do |ass_coach|
      coaching_staff[:assistants] << Coach.where(coach_function_id: ass_coach)
    end
    coaching_staff
  end

  def coaching_staff_functions(team)
    team_coaches = CoachFunction.where(team_id: team.id)
    head_coach_functions = team_coaches.where(coach_role: "head coach").pluck(:id)
    assistant_coach_functions = team_coaches.where(coach_role: "assistant").pluck(:id)
    function_id = []
    function_id << head_coach_functions
    function_id << assistant_coach_functions
    function_id.flatten
  end

  def set_team
    if params[:id].nil?
      @team = Team.find(current_player.team_id)
    else
      @team = Team.find(params[:id])
    end
  end




end
