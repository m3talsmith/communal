class SessionController < ApplicationController

  def create
    user = User.from_provider(request.env['omniauth.auth'])
    session[:user_id] = user.id if user
    redirect_to root_path
  end

end
