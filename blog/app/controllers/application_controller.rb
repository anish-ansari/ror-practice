class ApplicationController < ActionController::Base
  # including the helper here so every other controller can access it
  include SessionsHelper

  private

  # used to store location and redirect to the login form
  def logged_in_user
    # unless user is logged in then they will be redirected to log in first
    return if logged_in?

    store_location
    flash[:danger] = 'Please log in.'
    # After the user logs in, the user will be redirected back to the URL they tried to visit
    redirect_to login_url
  end
end
