class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :require_profile, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'サインアップに成功しました'
      log_in @user
      redirect_to new_profile_path
    else
      render 'new'
    end
  end

  def index; end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
