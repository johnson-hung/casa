class MyAccountController < ApplicationController
  def new
    @user = User.new
  end
  def create
     @user = User.find_by(email: params[:session][:email]) #I guss this already does the sanitization? (Based on: https://stackoverflow.com/questions/21886170/best-way-to-go-about-sanitizing-user-input-in-rails)
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
        end
  end
end
