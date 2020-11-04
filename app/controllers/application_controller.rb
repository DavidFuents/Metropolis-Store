class ApplicationController < ActionController::Base
    before_action :authorize_admin
    helper_method :current_user
    helper_method :logged_in?
   
    def current_user    
        Admin::User.find_by(id: session[:user_id])   
    end

    def logged_in?
        !current_user.nil?  
    end

    def authorize_admin
        redirect_to root_path unless Admin::User.find_by(id: session[:user_id])   
    end
end
