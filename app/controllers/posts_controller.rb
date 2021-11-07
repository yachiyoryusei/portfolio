class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save 
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
    def post_params
      params.require(:post).permit(:category_id)
    end
  
end
