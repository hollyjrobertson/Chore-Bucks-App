class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "  Hi " + user.username + "!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  def welcome
  end
  def page_requires_login
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
