class CustomerSessionsController < ApplicationController
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
