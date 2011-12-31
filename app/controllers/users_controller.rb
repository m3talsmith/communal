class UsersController < ApplicationController
  before_filter :force_user

  def dashboard
  end

  def edit
  end

  def update
    if @current_user.update_attributes params[:user]
      redirect_to dashboard_path, notice: 'Your user was updated'
    else
      flash[:error] = "We couldn't update your user"
      render action: edit
    end
  end

end
