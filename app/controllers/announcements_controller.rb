class AnnouncementsController < ApplicationController
  before_action :current_user
  
  def show
    id = params[:id] # retrieve announcement ID from URI route
    @announcement = Announcement.find(id) # look up announcement by unique ID
    # will render app/views/announcements/show.<extension> by default
  end

  def index
    sort = params[:sort] || session[:sort]
    case sort
    when 'title'
      ordering,@title_header = {:title => :asc}, 'bg-warning hilite'
    when 'release_date'
      ordering,@date_header = {:release_date => :asc}, 'bg-warning hilite'
    end
    @all_ratings = Announcement.all_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || {}

    if @selected_ratings == {}
      @selected_ratings = Hash[@all_ratings.map {|rating| [rating, rating]}]
    end

    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = @selected_ratings
      redirect_to :sort => sort, :ratings => @selected_ratings and return
    end
    @announcements = Announcement.where(rating: @selected_ratings.keys).order(ordering)
    
    
    
    # Hmm... tbh, this event stuff shouldn't be here lol
    e_sort = params[:e_sort] || session[:e_sort]
    case e_sort
    when 'name'
      ordering, @e_name_header = {:name => :asc}, 'bg-light'
    when 'location'
      ordering, @e_location_header = {:location => :asc}, 'bg-light'
    when 'start_at'
      ordering, @e_start_date_header = {:start_at => :asc}, 'bg-light'
    end
    
    if params[:e_sort] != session[:e_sort]
      session[:e_sort] = e_sort
      redirect_to :e_sort => e_sort and return
    end
    @events = Event.all.order(ordering);
    # events.save!
  end 
    
  def new
    # default: render 'new' template
  end

  def create
    @announcement = Announcement.create!(announcement_params) # combines new and save
    flash[:notice] = "#{@announcement.title} was successfully created."
    redirect_to announcements_path
  end

  def edit
    @announcement = Announcement.find params[:id]
   
  end

  def update
    @announcement = Announcement.find params[:id]
    @announcement.update_attributes!(announcement_params)
    flash[:notice] = "#{@announcement.title} was successfully updated."
    redirect_to announcements_path(@announcement)
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    flash[:notice] = "Announcement '#{@announcement.title}' deleted."
    redirect_to announcements_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def announcement_params
    params.require(:announcement).permit(:title, :rating, :author, :description, :release_date)
  end
end

