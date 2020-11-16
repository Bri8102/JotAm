class SessionsController < ApplicationController
    # before_action :authenticate_user!, except: :google

    def new
        # redirect_if_logged_in
        @user = User.new
    end


    def create
        @user = User.find_by(email: params[:email])
        # binding.pry
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'sessions/new'
        end
    end

    def destroy
        session.destroy
        redirect_to '/'
    end

    def omniauth
        # binding.pry
        @user = User.from_omniauth(auth)
        # binding.pry
        @user.save
        # binding.pry
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
    
    private
      
    def auth
        request.env['omniauth.auth']
    end
end
