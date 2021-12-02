CALM::Application.routes.draw do
  get '/home', to: 'announcements#index'
  
  get 'signup', to: 'signup#new'
  post 'signup', to: 'signup#create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  post 'logout', to: 'sessions#destroy'
  
  resources :announcements

  # map '/' to be a redirect to '/home'
  root :to => redirect('/home')
end
