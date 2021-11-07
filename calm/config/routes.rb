CALM::Application.routes.draw do
  get 'signup/create'

  resources :announcements
  # map '/' to be a redirect to '/announcements'
  root :to => redirect('/announcements')
end
