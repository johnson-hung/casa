class EventsController < ApplicationController
  
  def show
    id = params[:id] # retrieve Event ID from URI route
    @event = Event.find(id) # look up Event by unique ID
    # will render app/views/events/show.<extension> by default
  end

  def index
    # sort = params[:sort] || session[:sort]
    # case sort
    # when 'title'
    #   ordering,@title_header = {:title => :asc}, 'bg-warning hilite'
    # when 'release_date'
    #   ordering,@date_header = {:release_date => :asc}, 'bg-warning hilite'
    # end

    # @events = Event.order(ordering)
  end 
    
  def new
    # default: render 'new' template
  end

  def create
    @event = Event.create!(event_params) # combines new and save
    flash[:notice] = "#{@event.name} (#{@event.location}) was successfully created."
    redirect_to events_path
  end

  def edit
    @event = Event.find params[:id]
    @name = UserEvent.where("event_id = ?", params[:id]).to_a
    @x = @name.map{|x| x.user_id}
    @people = User.where(id: @x).to_a
    
    
  end

  def update
    @event = Event.find params[:id]
    @event.update_attributes!(event_params)
    flash[:notice] = "#{@event.name} was successfully updated."
    redirect_to edit_event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event '#{@event.name}' deleted."
    redirect_to events_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def event_params
    params.require(:event).permit(:name, :location, :start_at)
  end
end

