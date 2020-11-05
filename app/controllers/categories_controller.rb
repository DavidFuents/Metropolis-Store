class CategoriesController < ApplicationController
  skip_before_action :authorize_admin, only: [:index, :show]
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new 
  end

  def create
    @category = Category.create(name: category_params[:name])
    redirect_to edit_collection_path()
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to collection_category_path(@category)
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to edit()
  end

  private 

  def category_params
    params.require(:category).permit(:name)
  end
end
