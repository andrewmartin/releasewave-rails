module Users
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    include Devise::Controllers::Rememberable

    def omniauth_success
      puts 'AUTH HASH!!!!'
      puts auth_hash
      puts 'AUTH PARAMS11111!!!!'
      puts omniauth_params
      super do |resource|
        puts 'AUTH PARAMS2!!!!'
        puts @auth_params
        if omniauth_window_type.present? # auth requested from angular
          puts 'SIGNING IN!!!!'
          sign_in resource
        else # auth requested from backend standalone
          remember_me resource
          sign_in resource
          puts "AUTH PARAMS!!!"
          puts @auth_params
          puts 'HEADERS!!!!'

          query = @auth_params.to_query
          redirect_to("http://localhost:8080?#{query}") and return
          # sign_in_and_redirect resource and return
        end
      end
    end
  end
end