class Users::ProvidersController < ApplicationController
  before_filter :force_user

  def show
  #  render action: :update
  end

  def update
    session[:redirect_to] = profile_path
    redirect_to "/auth/#{params[:provider_id] ? params[:provider_id] : params[:id]}"
  end

  def destroy
    @current_user.providers.where(name: (params[:provider_id] ? params[:provider_id] : params[:id])).destroy_all
    redirect_to profile_path
  end
end
