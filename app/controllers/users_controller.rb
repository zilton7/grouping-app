class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  def index
  end

  def show
    @user = User.find(current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the app!'
      redirect_to @user
    else
      flash[:danger] = 'Error!'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
