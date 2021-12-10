class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_login
    if current_user == nil
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
  
  #We don't necessarily need the following because accessing home doesn't require login
  
  #def require_user
  #  redirect_to '/login' unless current_user
  #end
  
  #before_action :require_user, only: [:index, :show] #not sure if this has to be here

end
