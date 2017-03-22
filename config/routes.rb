Rails.application.routes.draw do
  root "pages#home"
  resources :users, only: [:index, :create]

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"
  get "/dashboard", to: "users#show", as: "dashboard"
  get "/new-account", to: "users#new", as: "new_user"
  get "/not-found", to: "pages#not_found", as: "not_found"
end
