class ApplicationApiController < ActionController::Base
  before_action :require_token

  private

  def require_token
    if params[:token].nil?
      render json: { 'status': 'ERROR', 'message': 'token not found' }, status: :bad_request
      return
    end
    unless User.exists?(token: params[:token])
      render json: { 'status': 'ERROR', 'message': 'user not found' }
      return
    end
  end
end