Easymeme::Application.routes.draw do

  get "memes/new"

  root to: 'static_pages#home'
  get '/new',   to: 'memes#new'
  get '/about', to: 'static_pages#about'
end
