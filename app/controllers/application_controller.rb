# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login
  before_action :require_profile

  private

  def require_login
    return if logged_in?

    flash[:error] = 'ログインしてください'
    redirect_to login_path
  end

  def require_profile
    redirect_to new_profile_path if current_user.profile.nil?
  end
end
