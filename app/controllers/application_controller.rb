class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_parent
    @current_parent ||= current_user.try(:parent)
  end

  def current_player
    @current_parent ||= current_user.try(:player)
  end

  def current_coach
    @current_parent ||= current_user.try(:coach)
  end

  def current_admin
    @current_profile ||= current_user.try(:admin)
  end

end
