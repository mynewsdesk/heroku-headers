require "rails/railtie"
require "heroku-headers"

module HerokuHeaders
  class Railtie < ::Rails::Railtie
    initializer "heroku-headers.middleware.rails" do |app|
      app.config.middleware.use HerokuHeaders::Middleware
    end
  end
end
