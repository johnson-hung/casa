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

describe SignupController, :type => :controller do
  
  describe 'Create' do
    it 'creates a new user and redirects to the CALM index page' do
      user_accout = User.all.count
      post :create, user: {:account_name=>'test account', :password=>'password', :password_confirmation=>'password', :first_name=>'first',:last_name=>'last', :email=>'testaccount@tamu.edu'}
      expect(User.all.count).to eq(user_accout+1)
      expect(response).to redirect_to(root_path)
    end
  end    
end