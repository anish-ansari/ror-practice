class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    # finding by email
    user = User.find_by(email: params[:session][:email].downcase) # converting the email entered in login page to lower case

    # if value of password entered in login page and db match then login
    if user && user.authenticate(params[:session][:password])
      # these methods are in helper file of same name
      log_in user
      redirect_back_or user
    else
      # display error message else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
