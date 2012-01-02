class Users::ProvidersController < ApplicationController
  def update
    session[:redirect_to] = profile_path
    redirect_to "/auth/#{params[:id]}"
  end

  def destroy
    @current_user.providers.where(name: params[:id]).destroy_all
    redirect_to profile_path
  end
end
