class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  skip_before_filter :verify_authenticity_token

  def new
  end

  def create
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:alert] = "Information invalid"
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
