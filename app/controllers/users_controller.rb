class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user = current_user
    @posts = @user.posts
  end
  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  
end
