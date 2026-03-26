Rails.application.routes.draw do
  root "homes#index"

  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create", as: "new_user_session"
  delete "/logout", to: "sessions#destroy", as: "logout"

  post "/signup", to: "users#register", as: "new_user_registration"
  get "/signup", to: "users#new", as: "signup"

  resources :users, expect: [ :create, :new ]
end
