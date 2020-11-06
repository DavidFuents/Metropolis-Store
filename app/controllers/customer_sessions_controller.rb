class CustomerSessionsController < ApplicationController
  skip_before_action :authorize_admin, only: [:index]
  def new
  end

  def create
  end

  def login
  end

  def destroy
  end

  def index
    @collections = Collection.all
    @categories = Category.all
  end
end
