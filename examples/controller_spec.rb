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

describe MoviesController, :type => :controller do
    describe 'find similar movies test' do
        let!(:movie1) { Movie.create!(title: 'I hate controller', director: 'Peter Wu') }
        let!(:movie2) { Movie.create!(title: 'I hate controller II', director: 'Peter Wu') }
        let!(:movie3) { Movie.create!(title: 'I hate controller II', director: 'Peter Wu') }
        let!(:movie4) { Movie.create!(title: 'I have controller III') }
        
        it 'should find similar movies if director exists' do
            movie = movie1
            get :search, { title: movie1.title }
            expect(assigns(:similar_movies)).to eql([movie1.title, movie2.title, movie3.title])
        end
      
        it "should redirect to root_url if director is empty" do
            get :search, { title: movie4.title }
            expect(response).to redirect_to(root_url) 
            expect(flash[:notice]).to eq(nil)
        end
    end
    
    
    describe 'Show' do
        let!(:movie) { Movie.create!(title: 'I am in the middle of finishing this', director: 'Peter Wu') }

        it 'should show the detail of the movie' do
            get :show, id: movie.id
            expect(assigns(:movie)).to eql(movie)
            expect(response).to render_template('show')
        end
    end
    
    
    describe 'Create' do
        it 'creates a new movie and redirects to the movie index page' do
            orig_movies_count = Movie.all.count
            post :create, movie: {:title=>"A hole new world", :director=>"Peter Wu"}
            expect(Movie.all.count).to eq(orig_movies_count + 1)

            expect(response).to redirect_to(movies_url)
        end
    end
    
    
    describe 'Edit' do
        let!(:movie) { Movie.create!(title: 'OX', director: 'Peter Wu') }

        before do
            get :edit, id: movie.id
        end

        it 'should edit a movie and redirect' do
            expect(assigns(:movie)).to eql(movie)
            expect(response).to render_template('edit')
        end
    end
    
    describe 'Update' do
        let!(:movie) { Movie.create!(title: 'OX', director: 'Peter Wu') }

        it 'updates a movie and redirects to the movie page' do
            put :update, id: movie.id, movie: {:title=>"OX"}
            movie.reload
            expect(movie.title).to eql('OX')

            expect(response).to redirect_to(movie_path(movie))
            expect(flash[:notice]).to eq("OX was successfully updated.")
        end
    end
    
    describe 'DELETE' do
        let!(:movie) { Movie.create!(title: 'OX', director: 'Peter Wu') }

        it 'deletes a movie and redirects to the home page and alert' do
            orig_movies_count = Movie.all.count
            delete :destroy, id: movie.id
            expect(Movie.all.count).to eq(orig_movies_count - 1)

            expect(response).to redirect_to(movies_path)
            expect(flash[:notice]).to eq("Movie 'OX' deleted.")
        end
    end
    
    
    describe 'GET Index' do
        it 'display index.html' do
            get :index
            expect(response).to render_template('index')
        end
    end


end