module HerokuHeaders
  # Rack compatible middleware to add heroku release info to headers
  class Middleware
    HEROKU_RELEASE_VERSION_HEADER = "Heroku-Release-Version".freeze
    HEROKU_SLUG_COMMIT_HEADER = "Heroku-Slug-Commit".freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      headers = headers.merge(
        HEROKU_RELEASE_VERSION_HEADER => ENV["HEROKU_RELEASE_VERSION"],
        HEROKU_SLUG_COMMIT_HEADER => ENV["HEROKU_SLUG_COMMIT"],
      )

      [status, headers, response]
    end
  end
end
