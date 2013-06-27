Easymeme::Application.routes.draw do

  get "memes/new"
  root to: 'static_pages#home'

  get '/about', to: 'static_pages#about'
end
