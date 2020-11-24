class ApplicationController < ActionController::Base
 
    helper_method :logged_in?, :current_user, :redirect_if_not_logged_in

    def logged_in?
        #checks if session is set to user-ID i.e if user is logged in returns true if so 
        session[:user_id]
    end

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end 
   
    
    def redirect_if_not_logged_in
        if !logged_in?
          flash[:error] = "Log in to View Your Lists."
          redirect_to login_path
        end 
    end 

end
