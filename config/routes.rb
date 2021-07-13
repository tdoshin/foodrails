Rails.application.routes.draw do
  resources :foodmodels
  resources :users, only: [:create]

  post "/login", to: "users#login"
  post "/signup", to: "users#create"
  get "/auto_login", to: "users#auto_login"

  get "/foodmodelsall", to: "foodmodels#index_all"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
