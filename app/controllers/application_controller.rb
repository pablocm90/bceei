class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  attr_accessor :current_parent, :current_player, :current_coach, :current_admin
  helper_method :current_parent, :current_player, :current_coach, :current_admin

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def current_parent
    @current_parent ||= current_user.try(:parent)
  end

  def current_player
    @current_player ||= current_user.try(:player)
  end

  def current_coach
    @current_coach ||= current_user.try(:coach)
  end

  def current_admin
    @current_admin ||= current_user.try(:admin)
  end

end
