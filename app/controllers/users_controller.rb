class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params.require(:user).permit(:name, :password,
      :nausea, :tickets, :happiness, :height, :admin))
    session[:user_id] = @user.id  
    redirect_to @user
  end
  
  def show
    @user = User.find(params[:id])
  end 
  
  def signin
    @user = User.new
  end
  
  def signout
    session.clear
    redirect_to root_path
  end
  
  def start_session
    session[:user_id] = params[:user][:id]
    user = User.find(session[:user_id])
    redirect_to user
  end
end
