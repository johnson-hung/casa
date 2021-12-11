require 'spec_helper'
require 'rails_helper'

if RUBY_VERSION>='2.3.0'
    if Rails.version < '5'
      class ActionController::TestResponse < ActionDispatch::TestResponse
        def recycle!
          # hack to avoid MonitorMixin double-initialize error:
          @mon_mutex_owner_object_id = nil
          @mon_mutex = nil
          initialize
        end
      end
    else
      puts "Monkeypatch for ActionController::TestResponse no longer needed"
    end
end

describe EventsController, :type => :controller do

  describe 'Show' do
    let!(:event) {Event.create!(name: 'Testing Event Create') }

    it 'should show the detail of the event' do
        get :show, id: event.id
        expect(response).to render_template('show')
    end
  end
  
  describe 'Create' do
    it 'creates a new event and redirects to the CALM index page' do
      organizer_count = Event.all.count
      post :create, event: {:name=> "ISCA", :location=>"New York"}
      expect(Event.all.count).to eq(organizer_count+1)
      expect(response).to redirect_to(events_path)
    end
  end    
  # name location start_at
  
  describe 'Edit' do
    let!(:event) {Event.create!(name: 'Testing Event Create') }
    
    before do 
      get :edit, id: event.id
    end
    
    it 'should edit an event and redirect' do
      expect(assigns(:event)).to eql(event)
      expect(response).to render_template('edit')
    end
  end  
  
  describe 'Update' do
    let!(:event){Event.create!(name: 'Testing Event Create') }
    
    it 'Update an event and redirect to the home page' do
      put :update, id: event.id, event: {:name=>'Changing conference'}
      event.reload
      expect(event.name).to eql('Changing conference')
    end
  end
  
  describe 'DELETE' do
    let!(:event){Event.create!(name: 'Testing Event Create') }
    it 'Delete an event and redirect to the home page' do
      organizer_count = Event.all.count
      delete :destroy, id: event.id
      expect(Event.all.count).to eql(organizer_count-1)
      
      expect(response).to redirect_to(events_path)
    end
  end
  
end