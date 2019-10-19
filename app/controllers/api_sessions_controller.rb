class ApiSessionsController < ApplicationApiController
  def login
    @user = User.find_by(email: params[:email].downcase)
    if @user&.authenticate(params[:password])
      render json: { 'token': @user.token }
    else
      render json: { 'error': 'no auth' }
    end
  end

  def show
    user = User.find_by(token: params[:token])
    profile = Profile.find_by(user: user)
    render json: { 'user_id': user.id,
                   'name': profile.name,
                   'nickname': profile.nickname,
                   'skills': profile.skills,
                   'affiliation1': profile.affiliation1,
                   'affiliation2': profile.affiliation2,
                   'Github': profile.githubID,
                   'Qiita': profile.QiitaID,
                   'otherURL': profile.otherURL }
  end
end
