Rails.application.routes.draw do
  root 'homes#index'

  resources :users, only: %i[index show edit]
  resources :profile, only: %i[index show edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
