CALM::Application.routes.draw do
  
  
  resources :announcements
  # map '/' to be a redirect to '/announcements'
  root :to => redirect('/announcements')
  
  get 'signup'  => 'users#new'
  resources :users 
  
  get '/login' => 'sessions#new'
  
  post 'login' => 'sessions#create'
  
  delete 'logout' => 'sessions#destroy'
  
end
