class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    
    def create
<<<<<<< HEAD
        @user = User.find_by(email: params[:session][:email]) #I guss this already does the sanitization? (Based on: https://stackoverflow.com/questions/21886170/best-way-to-go-about-sanitizing-user-input-in-rails)
=======
        @user = User.find_by(email: params[:session][:email])
>>>>>>> fa61f1c8a07f907d802571f395f7a530e90a24b0
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash[:notice] = 'Login successful'
            redirect_to '/'
        else
            flash.now[:notice] = 'Invalid user/password combination'
            render 'new'
        end
    end
    
<<<<<<< HEAD
    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Successfully logged out'
        redirect_to '/'
    end
    
=======
>>>>>>> fa61f1c8a07f907d802571f395f7a530e90a24b0
    
end
