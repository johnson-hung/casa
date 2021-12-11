CALM::Application.routes.draw do
  
  # This would do the trick, but definitely not a good approach...
  get 'events', to: 'announcements#index'
  post 'events/new', to: 'events#create'
  put 'events/:id/edit', to: 'events#update'
  
  get 'events/:event_id/signup', to: 'events_signup#new', as: 'events_signup'
  post 'events/:event_id/signup', to: 'events_signup#create'

  resources :research_interests
 
  get '/user/:id', to: 'users#edit', as: 'edit_user'
  patch '/user/:id', to: 'users#update'

  get 'signup', to: 'signup#new'
  post 'signup', to: 'signup#create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  post 'logout', to: 'sessions#destroy'
  
  resources :events
  
  resources :announcements
  resources :events
  # map '/' to be a redirect to '/announcements'
  root :to => redirect('/announcements')
  
end
