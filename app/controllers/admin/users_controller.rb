class Admin::UsersController < ApplicationController
  skip_before_action :authorize_admin, only: [:new, :create]

  def new
    @admin_user = Admin::User.new 
  end

  def create
    @admin_user = Admin::User.create(username: admin_params[:username], password: admin_params[:password])
    session[:user_id] = @admin_user.id
    redirect_to admin_dashboard_path
  end

  private 

  def admin_params 
    params.require(:admin_user).permit(:username, :password)
  end
end
