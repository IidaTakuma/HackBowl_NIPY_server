# frozen_string_literal: true

module ApplicationHelper
  def current_users_profile
    Profile.find_by(user: current_user.id)
  end
end
