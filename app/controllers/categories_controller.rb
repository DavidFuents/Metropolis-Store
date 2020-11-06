class CategoriesController < ApplicationController
  skip_before_action :authorize_admin, only: [:show]
  
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
    @category = Category.new(name: category_params[:name])

    if @category.valid? 
      @category.save
      redirect_to admin_dashboard_path
    else 
      flash[:alert] = "This category already exist!"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_dashboard_path
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_dashboard_path
  end

  private 

  def category_params
    params.require(:category).permit(:name)
  end
end
