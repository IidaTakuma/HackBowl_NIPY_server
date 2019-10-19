class FriendshipsController < ApplicationController
  skip_before_action :require_login, only: %i[create]
  skip_before_action :require_profile, only: %i[create]
  protect_from_forgery
  def create
    friendship = Friendship.new(friendship_params)
    if friendship.save
      render json: { 'status': 'SUCCESS', 'message': 'create friendship succeeded' }
    else
      render json: { 'status': 'ERROR', 'message': 'error has occured' }
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:follower_id, :following_id)
  end
end
