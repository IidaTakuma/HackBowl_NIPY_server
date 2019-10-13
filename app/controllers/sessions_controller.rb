class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      log_in user
      redirect_to current_user
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
