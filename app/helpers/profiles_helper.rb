module ProfilesHelper
  def current_users_profile
    Profile.find_by(user: current_user)
  end
end
