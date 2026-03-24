Rails.application.routes.draw do
  post "/signup", to: "users#create", as: "new_user_registration"
  get "/signup", to: "users#new", as: "signup"

  resources :users, expect: [ :create, :new ]

  get "up" => "rails/health#show", as: :rails_health_check
end
