Rails.application.routes.draw do
  root to: "home#index"

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

      resources :user, only: [:get, :update, :destroy]
      resources :artists

      namespace :admin do
        resources 'users', controller: 'admin_users'
      end

    end

  end
end
