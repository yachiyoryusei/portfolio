class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @post = Post.new
    @current_categories = Category.where(user_id: current_user.id)
  end
  
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save 
      respond_to do |format|
        format.html {redirect_to posts_path}
        format.json {render json: @post }
      end
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
      params.require(:post).permit(:user_id, :type, :category_id, :amount, :note, :date)
    end
    
  
end
