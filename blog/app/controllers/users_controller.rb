class UsersController < ApplicationController
  # restrict users that are not logged in
  # if users are logged in then only direct to show page
  before_action :logged_in_user, only: [:show]
  before_action :find_user, only: [:show]

  def show
    # this way if an unauthorized user tries to access other user's data then their value is set to nil
    return if current_user?(@user)

    @user = nil
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the app'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
