Rails.application.routes.draw do
  # Página root
  root "sessions#new"

  # Autenticación
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create", as: "new_user_session"
  delete "logout", to: "sessions#destroy", as: "logout"

  # Registro
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create", as: "register"

  # Página principal
  get "/home", to: "homes#index", as: "home"

  # CRUD usuarios (sin signup)
  resources :users, except: [ :new, :create ]
end
