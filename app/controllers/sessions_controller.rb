class SessionsController < ApplicationController
  def new
  end

  #Login Method - Creates a session by setting :session_id
  def create
    flash[:notice] = 'Successfully Logged In'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:notice] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    flash[:notice] = 'Successfully Logged Out'
    log_out
    redirect_to root_url
  end
end
