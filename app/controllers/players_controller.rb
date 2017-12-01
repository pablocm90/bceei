class PlayersController < ApplicationController
  before_action :set_player, only: [:edit, :update]


  def edit
    authorize @player
  end

  def update
    authorize @player
    current_player.short_size = player_params[:short_size]
    current_player.shirt_size = player_params[:shirt_size]
    if current_player.save
      redirect_to root_path
    else
      raise
    end
  end

  private

  def set_player
    @player = current_player
  end

  def player_params
     params.require(:player).permit(:short_size, :shirt_size, {user_atributes: [:f_name, :l_name, :dob, :phone, :coach, :player, :parent]})
  end

end
