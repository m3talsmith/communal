class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user

private

  def set_current_user
    return true unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def force_user
    redirect_to new_session_path unless session[:user_id]
    set_current_user
  end
end
