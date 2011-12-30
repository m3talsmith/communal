class SessionController < ApplicationController

  def create
    user = User.from_provider(request.env['omniauth.auth']) if request.env['omniauth.auth']
    session[:user_id] = user.id if user
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
