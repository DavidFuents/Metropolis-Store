class ProductsController < ApplicationController
  skip_before_action :authorize_admin, only: [:show]

  def show
    @product = Product.find(params[:id])
  end

  def new 
    @product = Product.new(collection_id: params[:collection_id])
  end

  def create 
    @product = Product.new(name: product_params[:name], price: product_params[:price], stock: product_params[:stock], collection_id: params[:collection_id], category_id: product_params[:category_id])
    if @product.valid?
      @product.save
    redirect_to admin_dashboard_path
    else  
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_dashboard_path
  end

  def destroy
    Product.find(params[:id]).destroy 
    redirect_to admin_dashboard_path
  end

  private 

  def product_params 
    params.require(:product).permit(:name, :price, :stock, :collection_id, :category_id)
  end
end
