Rails.application.routes.draw do
  root "pages#home"

  get "/not-found", to: "pages#not_found", as: "not_found"
end
