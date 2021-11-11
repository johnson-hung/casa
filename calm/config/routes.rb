CALM::Application.routes.draw do
  get 'signup', to: 'signup#new'
  post 'signup', to: 'signup#create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
<<<<<<< HEAD
  
  delete 'logout', to: 'sessions#destroy'
  
=======

>>>>>>> fa61f1c8a07f907d802571f395f7a530e90a24b0
  resources :announcements
  # map '/' to be a redirect to '/announcements'
  root :to => redirect('/announcements')
end
