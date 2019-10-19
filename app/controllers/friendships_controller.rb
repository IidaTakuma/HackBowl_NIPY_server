class FriendshipsController < ApplicationApiController
  skip_before_action :require_token, only: %i[]
  protect_from_forgery

  def create
    follower = User.find_by(id: params[:user_id])
    following = User.find_by(token: params[:token])
    friendship = Friendship.new(follower_id: follower.id, following_id: following.id)
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
