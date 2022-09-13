Rails.application.routes.draw do
  root to: "home#index"

  get "/feed", to: "home#index"

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for "User", at: "auth", controllers: {
                                            omniauth_callbacks: "users/omniauth_callbacks",
                                          }

      put "options", to: "options#update"
      get "options", to: "options#show"

      get "current_user", to: "user#current_user"
      get "users", to: "user#index"
      get "artist-search/:search", to: "artist_search#get"

      resources :user, only: [:get, :update, :destroy]
      get "search/:query", to: "search#search"

      get "artists/:artistSlug/releases", to: "artists#releases"

      resources :artists
      resources :releases do
        resources :reviews
      end
      resources :tags
      resources :articles

      namespace :admin do
        resources "users", controller: "admin_users"
      end
    end
  end
end
