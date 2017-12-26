class CoachesController < ApplicationController
  before_action :set_coach

  def edit
    authorize @coach
  end

  def update
    authorize @coach
    current_coach.update(coach_params)
    if current_player.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_coach
    @coach = current_coach
  end

  def coach_params
    params.require(:coach).permit(:diplome)
  end

end
