class Users::PostsController < UsersController
  before_filter :force_user
  
  def new
    @post = @current_user.posts.new
  end

  def create
    @post = @current_user.posts.new params[:post]
    if @post.save
      redirect_to dashboard_path, notice: 'A new post has been drafted'
    else
      flash[:error] = "Your post wasn't saved"
      render :new
    end
  end

end
