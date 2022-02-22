class PostsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, except: [:index]
  helper_method :current_user, :logged_in?
  
  def index
    @posts = Post.all.order(id: :desc)
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all.order(id: :desc)
    @user = current_user
    
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end
 
  def update
    # keep for editing a post in same form later
  end

  def destroy
    # keep for deleting a post later
  end

  private
  
  def post_params
    params.require(:post).permit(:id, :body, :user_id)
  end

end
