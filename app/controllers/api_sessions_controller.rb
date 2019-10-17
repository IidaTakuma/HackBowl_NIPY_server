class ApiSessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      render json: @user.token
    else
      render json: 'no auth'
    end
  end
end
