class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :redirect_if_not_logged_in

  def require_user
    if session[:user_id].blank?
      redirect_to new_sessions_path
      return
    end
  end

  def has_account?
    !!current_user.stripe_user_id
  end



end
