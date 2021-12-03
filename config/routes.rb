CALM::Application.routes.draw do
  
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  # get 'events/edit'
  
  # post 'events', to: 'events#new' 
  
  # This would do the trick, but definitely not a good approach...
  get 'events', to: 'announcements#index'
  post 'events/new', to: 'events#create'
  put 'events/:id/edit', to: 'events#update'
  
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
  # map '/' to be a redirect to '/announcements'
  root :to => redirect('/announcements')
  
end
