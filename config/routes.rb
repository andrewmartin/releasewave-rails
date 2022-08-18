Rails.application.routes.draw do
  root to: "home#index"

  get "/feed", to: "home#index"

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
         omniauth_callbacks: "users/omniauth_callbacks"
      }

      get 'current_user', to: 'user#current_user'
      get "artist-search/:search", to: "artist_search#get"

      mount_devise_token_auth_for "User", at: "auth", controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

      resources :user, only: [:get, :update, :destroy]
      get "search/:query", to: "search#search"
      resources :artists
      resources :releases do
        resources :reviews
      end

      namespace :admin do
        resources "users", controller: "admin_users"
      end
    end
  end
end
