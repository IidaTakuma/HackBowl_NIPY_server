class ProfilesController < ApplicationController
  skip_before_action :require_profile, only: %i[new create]
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
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.new(profile_params.merge(user: current_user))
    if @profile.save
      flash[:success] = 'プロフィールの変更を保存しました'
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :nickname, :icon, :affiliation1, :affiliation2,
                                    :githubID, :QiitaID, :otherURL, :skills)
  end
end
