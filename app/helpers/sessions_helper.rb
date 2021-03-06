module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Checks to see if current user is an admin
  def is_admin?
    if current_user == nil
      false
    elsif current_user.email == ENV['app_admin_email']
      true
    elsif current_user.email == ENV['app_coadmin_email']
      true
    else
      false
    end
  end

  #Sets Notice color
  def set_font_color(var)
    if var == 'Successfully Logged Out'
      "text-danger"
    elsif var == 'Invalid email/password combination'
      "text-danger"
    end
  end

end
