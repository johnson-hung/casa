CALM::Application.routes.draw do
  get 'signup', to: 'signup#new'
  post 'signup', to: 'signup#create'

  resources :announcements
  # map '/' to be a redirect to '/announcements'
  root :to => redirect('/announcements')
end
