class Admin::SessionsController < ApplicationController
  skip_before_action :authorize_admin, only: [:new, :create, :login]

  def new
    admin_user =  Admin::User.find_by(id: params[:username])
    if logged_in?
      redirect_to admin_dashboard_path
    else 
      render :new 
    end 
  end

  def create
    admin_user = Admin::User.find_by(username: params[:username])
    if admin_user && admin_user.authenticate(params[:password])
      session[:user_id] = admin_user.id 
      redirect_to admin_dashboard_path
    else 
      redirect_to new_admin_user_path
    end
  end

  def login
  end

  def delete
    session.clear
    redirect_to root_path
  end

  def dashboard
    if logged_in?
      flash[:alert] = 'Logged in as'
    end

    @collections = Collection.all
    @categories = Category.all
  end
end
