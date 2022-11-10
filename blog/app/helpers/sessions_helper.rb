module SessionsHelper
  def log_in(user)
    # assigning session id to the current user id
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      # ||= says to set @current_user to User.find_by(id: session[:user_id]) if it in nil, false or undefined
      # otherwise set it to @current_user i.e. do nothing
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    # returns true or false based on whether there is a current user or not
    !current_user.nil?
  end

  def log_out
    # log out the user by deleting the session and setting the current_user to nil
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    # accepts user and returns true if it's the same with the current user or false otherwise
    # This can be useful to restrict a user from visiting other user's details
    user == current_user
    # byebug
  end

  # to redirect a non logged-in user to the first visited URL after logging in
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
