module HerokuHeaders
  # Rack compatible middleware to add heroku release info to headers
  class Middleware
    def initialize(app)
      @app = app
      @heroku_header = {
        "Heroku-Release" => "#{ENV['HEROKU_RELEASE_VERSION']}, #{ENV['HEROKU_SLUG_COMMIT']}, #{ENV["HEROKU_RELEASE_CREATED_AT"]}",
      }.freeze
    end

    def call(env)
      status, headers, response = @app.call(env)

      headers = headers.merge(@heroku_header)

      [status, headers, response]
    end
  end
end
