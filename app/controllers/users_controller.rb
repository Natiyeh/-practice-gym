class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    redirect_to root_path unless current_user.admin? || current_user == @user
  end

  def index
    @users = User.all
    redirect_to root_path unless current_user.admin?
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
