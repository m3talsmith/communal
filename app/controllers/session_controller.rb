class SessionController < ApplicationController

  def new
    redirect_to "/auth/#{params[:provider]}"
  end

  def create
    if @current_user
      @current_user.add_provider(request.env['omniauth.auth']) if request.env['omniauth.auth']
      user = @current_user
    else
      user = User.from_provider(request.env['omniauth.auth']) if request.env['omniauth.auth']
    end

    if user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
