require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReleasewaveRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.action_controller.forgery_protection_origin_check = false
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http:\/\/localhost:(.*)', "https://releasewave.com", "https://www.releasewave.com", /\Ahttp:\/\/localhost:(.*)\z/, "https://releasewave-react.vercel.app", /\Ahttp(.*):\/\/(.*).ngrok.io(.*)\z/

        resource "*", :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options, :head], :expose => ["uid", "client", "expiry", "access-token", "token-type"]
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
