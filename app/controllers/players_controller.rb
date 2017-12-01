class PlayersController < ApplicationController
  before_action :set_player, only: [:edit, :update]


  def edit
    authorize @player
  end

  def update
  end

  private

  def set_player
    @player = current_player
  end

end
