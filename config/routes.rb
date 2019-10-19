Rails.application.routes.draw do
  get 'friendships/new'
  root 'homes#index'
  resources :users, only: %i[new create index show edit update]
  resources :profiles, only: %i[new create show edit update]
  resources :follows, only: %i[new create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Use for API
  get 'api_sessions/login'
  get 'api_sessions/show'
  post 'friendships/create'
end
