class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        #@user = User.find_by_emails(params[:session][:email]) #deprecated (https://stackoverflow.com/questions/23195203/ruby-on-rails-undefined-method-find-by-email)
        @user = User.find_by email: params[:session][:email] #not sure why this doesn't work
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to 'login'
        end
    end
    
    
    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

end
