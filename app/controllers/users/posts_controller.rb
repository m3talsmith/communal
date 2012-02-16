class Users::PostsController < UsersController
  before_filter :force_user
  before_filter :set_public_user, only: [:index, :drafts]
  
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

  def index
    @posts = @user.posts.all
  end

  def drafts
    @posts = @user.posts.drafts
    render template: 'users/posts/index'
  end

private

  def set_public_user
    @user  = User.find params[:user_id]
  end

end
