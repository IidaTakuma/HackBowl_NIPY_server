class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params.merge(user: current_user))
    if @profile.save
      flash[:success] = 'プロフィールを保存しました'
      redirect_to @profile
    else
      flash.now[:denger] = '何かが間違っています'
      render 'new'
    end
  end

  def edit; end

  def update; end

  private

  def profile_params
    params.require(:profile).permit(:name, :nickname, :icon, :skills)
  end
end
