class ApiSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[login]
  skip_before_action :require_profile, only: %i[login]
  def login
    @user = User.find_by(email: params[:email].downcase)
    if @user&.authenticate(params[:password])
      render json: { 'token': @user.token }
    else
      render json: { 'error': 'no auth' }
    end
  end
end
