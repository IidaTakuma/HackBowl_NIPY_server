Rails.application.routes.draw do
  get 'api_sessions/login'
  root 'homes#index'
  resources :users, only: %i[new create index show edit update]
  resources :profiles, only: %i[new create show edit update]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
