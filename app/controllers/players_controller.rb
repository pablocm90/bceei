class PlayersController < ApplicationController
  before_action :set_player, only: [:edit, :update]
  before_action :set_team, only: [:edit, :update]


  def edit
    authorize @player
    available_numbers
  end

  def update
    authorize @player
    current_player.update(player_params)
    if current_player.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_player
    @player = current_player
  end

  def set_team
    @team = Team.find(current_player.team_id)
  end

  def player_params
     params.require(:player).permit(:short_size, :shirt_size, :number)
  end

  def available_numbers
    @available_numbers = (@team.available_numbers(@player) << @player.number).sort
  end

end
