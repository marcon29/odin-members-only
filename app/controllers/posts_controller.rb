class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(id: :desc)
    @post = Post.new
    @user = User.first        # need to switch to current_user
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all.order(id: :desc)
    @user = User.first        # need to switch to current_user
    
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def post_params
    params.require(:post).permit(:id, :body, :user_id)
  end

end
