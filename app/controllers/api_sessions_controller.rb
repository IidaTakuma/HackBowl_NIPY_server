class ApiSessionsController < ApplicationApiController
  skip_before_action :require_token, only: %i[login]
  protect_from_forgery
  def login
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      if !user.profile.nil?
        profile = Profile.find_by(user: user)
        render json: { 'token': user.token,
                       'user_id': user.id,
                       'name': profile.name,
                       'nickname': profile.nickname,
                       'skills': profile.skills,
                       'affiliation1': profile.affiliation1,
                       'affiliation2': profile.affiliation2,
                       'Github': profile.githubID,
                       'Qiita': profile.QiitaID,
                       'otherURL': profile.otherURL }, status: 200
      else
        render json: { 'status': 'ERROR',
                       'message': 'profile not found' }
      end
    else
      render json: { 'status': 'ERROR',
                     'message': 'no auth' }
    end
  end
end
