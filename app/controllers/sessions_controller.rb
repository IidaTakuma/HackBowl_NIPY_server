class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :require_profile, only: %i[new create destroy]
  def new; end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      log_in user
      redirect_to profile_path(Profile.find_by(user_id: user.id))
    else
      flash.now[:denger] = 'メールアドレスまたはパスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
