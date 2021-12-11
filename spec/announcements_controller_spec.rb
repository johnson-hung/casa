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

describe AnnouncementsController, :type => :controller do

  describe 'Show' do
    let!(:announcement) {Announcement.create!(title: 'Testing Announcement Create') }

    it 'should show the detail of the announcement' do
        get :show, id: announcement.id
        expect(response).to render_template('show')
    end
  end
  
  describe 'GET Index' do
    it 'display index.html' do
        get :index
        expect(response).to render_template('index')
    end
  end
  
  describe 'Create' do
    it 'creates a new announcement and redirects to the CALM index page' do
      organizer_count = Announcement.all.count
      post :create, announcement: {:title=> "Testing", :author=>"Q"}
      expect(Announcement.all.count).to eq(organizer_count+1)
      expect(response).to redirect_to(announcements_path)
    end
  end    
  
  describe 'Edit' do
    let!(:announcement) {Announcement.create!(title: 'Testing', author: 'Q')}
    
    before do 
      get :edit, id: announcement.id
    end
    
    it 'should edit an announcement and redirect' do
      expect(assigns(:announcement)).to eql(announcement)
      expect(response).to render_template('edit')
    end
  end  
  
  describe 'Update' do
    let!(:announcement){ Announcement.create!(title: 'Testing', author: 'Q')}
    
    it 'Update an announcement and redirect to the home page' do
      put :update, id: announcement.id, announcement: {:title=>'Changing Title'}
      announcement.reload
      expect(announcement.title).to eql('Changing Title')
    end
  end
  
  describe 'DELETE' do
    let!(:announcement){ Announcement.create!(title: 'Testing', author: 'Q')}
    it 'Delete an announcement and redirect to the home page' do
      organizer_count = Announcement.all.count
      delete :destroy, id: announcement.id
      expect(Announcement.all.count).to eql(organizer_count-1)
      
      expect(response).to redirect_to(announcements_path)
    end
  end
  
end