class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  
  def index
    @category = Category.new
    @categories = Category.all
  end
  
  def create 
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      respond_to do |format|
        format.html {redirect_to categories_path}
        format.json {render json: @category }
      end
    else
      respond_to do |format|
        format.html {render 'index' }
        format.json {render json: @category.errors.full_messages, status: 422 }
      end
    end
  end
  
  def edit
     @category = Category.find_by(id: params[:id])
  end
  
  
  def update
    @category = Category.find_by(id: params[:id])
    if @category.update(category_params)
      respond_to do |format|
        format.html {redirect_to categories_path}
        format.json {render json: @category }
      end
    else
      respond_to do |format|
        format.html {render 'index' }
        format.json {render json: @category.errors.full_messages, status: 422 }
      end
    end
  end
  
  def destroy
    @category.destroy
    redirect_to categories_path
  end
  
  
  private
  
    def set_category
      @category = Category.find(params[:id])
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
end
