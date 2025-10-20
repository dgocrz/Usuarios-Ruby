Rails.application.routes.draw do
  # Rutas principales de posts
  resources :posts, only: [:new, :create, :destroy]

  # Rutas de usuarios (registro, perfil)
  resources :users, only: [:new, :create, :show]

  # Rutas de sesión (login/logout)
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # Dashboard
  get "/dashboard", to: "dashboard#index"

  # Ruta raíz (página principal)
  root "sessions#new"
end
