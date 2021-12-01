class EventsController < ApplicationController
  
  def show
    id = params[:id] # retrieve Event ID from URI route
    @event = Event.find(id) # look up Event by unique ID
    # will render app/views/Events/show.<extension> by default
  end

  def index
    sort = params[:sort] || session[:sort]
    case sort
    when 'title'
      ordering,@title_header = {:title => :asc}, 'bg-warning hilite'
    when 'release_date'
      ordering,@date_header = {:release_date => :asc}, 'bg-warning hilite'
    end

    @events = Event.order(ordering)
  end 
    
  def new
    # default: render 'new' template
  end

  def create
    @event = Event.create!(Event_params) # combines new and save
    flash[:notice] = "#{@event.title} was successfully created."
    redirect_to Events_path
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]
    @event.update_attributes!(Event_params)
    flash[:notice] = "#{@event.title} was successfully updated."
    redirect_to Events_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event '#{@event.title}' deleted."
    redirect_to Events_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def Event_params
    params.require(:Event).permit(:title, :author, :description, :release_date)
  end
end

