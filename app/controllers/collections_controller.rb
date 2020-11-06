class CollectionsController < ApplicationController
  skip_before_action :authorize_admin, only: [:show]

  def index 
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.create(name: collection_params[:name])
    redirect_to admin_dashboard_path
  end

  def edit 
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update(collection_params)
    redirect_to admin_dashboard_path
  end

  def destroy
    Collection.find(params[:id]).destroy
    redirect_to admin_dashboard_path
  end

  private 

  def collection_params 
    params.require(:collection).permit(:name)
  end
end
