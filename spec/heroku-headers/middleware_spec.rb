require "spec_helper"

module HerokuHeaders
  RSpec.describe Middleware do
    it "adds headers" do
      ENV["HEROKU_RELEASE_VERSION"] = "v108"
      ENV["HEROKU_SLUG_COMMIT"] = "ff5b3eb5eba4306b4e8fbba7df95ef5f56d87491"

      app = -> (env) { [200, {"Content-Type" => "text/plain"}, ["OK"]] }

      _, headers, _ = Middleware.new(app).call({})

      expect(headers).to include(
        "Heroku-Release-Version" => "v108",
        "Heroku-Slug-Commit" => "ff5b3eb5eba4306b4e8fbba7df95ef5f56d87491",
      )
    end
  end
end
