Rails.application.routes.draw do
  # -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- #

  # Page open app
  root "sessions#login"
  resources :sessions
  # Login, create session and logout
  # get "/login", to: "sessions#login", as: "login"
  # post "/login", to: "sessions#create", as: "new_user_session"
  # delete "/logout", to: "sessions#destroy", as: "logout"

  # Register
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create", as: "register"

  # Home page
  get "/home", to: "homes#index", as: "home"

  # -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- #

  # Routes users controllers
  # resources :users, expect: [ :create, :new ]
end
