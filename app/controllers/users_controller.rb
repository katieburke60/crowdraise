class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
    if !is_myself?
      redirect_to '/'
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
