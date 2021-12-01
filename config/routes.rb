CALM::Application.routes.draw do
  
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  # get 'events/edit'
  
  # post 'events', to: 'events#new' 
  
  # This would do the trick, but definitely not a good approach...
  get 'events', to: 'announcements#index'
  
  get 'signup', to: 'signup#new'
  post 'signup', to: 'signup#create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  post 'logout', to: 'sessions#destroy'
  
  resources :announcements
  # map '/' to be a redirect to '/announcements'
  root :to => redirect('/announcements')
  
end
