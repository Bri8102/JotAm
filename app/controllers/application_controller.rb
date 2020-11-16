class ApplicationController < ActionController::Base
 
    helper_method :redirect_if_logged_in, :logged_in?, :current_user, :redirect_if_not_logged_in

    def logged_in?
        #checks if session is set to user-ID i.e if user is logged in returns true if so 
        !!session[:user_id]
    end

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end 
   
    
    def redirect_if_not_logged_in
        if !logged_in?
          flash[:errors] = "Log in to View."
          redirect_to "/login"
        end 
    end 
  
    def redirect_if_logged_in 
        if logged_in?
          redirect_to "/"
        end
    end 
end
