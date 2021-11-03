CALM::Application.routes.draw do
  resources :announcements
  # map '/' to be a redirect to '/announcements'
  root :to => redirect('/announcements')
end
