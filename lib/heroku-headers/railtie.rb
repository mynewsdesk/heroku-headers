require "rails/railtie"
require "heroku-headers"

module HerokuHeaders
  class Railtie < ::Rails::Railtie
    initializer "heroku-headers.middleware.rails" do |app|
      if ENV["HEROKU_RELEASE_VERSION"] && ENV["HEROKU_SLUG_COMMIT"]
        app.config.middleware.use HerokuHeaders::Middleware
      else
        Rails.logger.debug "Skipping heroku-headers middleware since Heroku ENV variables not available"
      end
    end
  end
end
