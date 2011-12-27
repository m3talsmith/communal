class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user

private

  def set_current_user
    return true unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
