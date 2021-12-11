class EventsSignupController < ApplicationController
  before_action :require_login
  
  def new
    @userEvent = UserEvent.new()
  end
  
  def create
    event_id = params['event_id']
    if !Event.exists?(event_id)
        flash[:alert] = "Event id #{event_id} does not exist"
        redirect_to root_path 
        return
    end
    
    @userEvent = UserEvent.new(user_id: @current_user.id, event_id: event_id)
    
    if @userEvent.valid?
      @userEvent.save
      redirect_to root_path, notice: 'Successfully signed up'
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end
  
  private
  def events_signup_params
    params.require(:user).permit(:event_id)
  end
end
