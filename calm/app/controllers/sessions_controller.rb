class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    
    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash[:notice] = 'Login successful'
            redirect_to '/'
        else
            flash.now[:notice] = 'Invalid user/password combination'
            render 'new'
        end
    end
    
    
end
