class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @post = Post.new
    @current_categories = Category.where(user_id: current_user.id)
  end
  
  def index
    @posts = Post.all
    @current_user = User.find_by(id: session[:user_id])
  end

  def create
    @post = Post.new(post_params)
    @current_categories = Category.where(user_id: current_user.id)
    @post.user_id = current_user.id
    if @post.save 
      respond_to do |format|
        format.html {redirect_to posts_path}
        format.json {render json: @post }
      end
    else
      respond_to do |format|
        format.html {render 'new' }
        format.json {render json: @post.errors.full_messages, status: 422 }
      end
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    @current_categories = Category.where(user_id: current_user.id)
  end  

  def update
    @post = Post.find_by(id: params[:id])
    @current_categories = Category.where(user_id: current_user.id)
    @post.user_id = current_user.id
    if @post.update(post_params)
     respond_to do |format|
        format.html {redirect_to posts_path}
        format.json {render json: @post }
      end
    else
      respond_to do |format|
        format.html {render 'edit' }
        format.json {render json: @post.errors.full_messages, status: 422 }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end
  
  private
    def post_params
      params.require(:post).permit(:user_id, :type, :category_id, :amount, :note, :date)
    end
    
  
end
