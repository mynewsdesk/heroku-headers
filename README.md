# heroku-headers

A middleware which adds information from Heroku's lab project
`runtime-dyno-metadata` to your response headers, for example:

```
Heroku-Release: v108, ff5b3eb5eba4306b4e8fbba7df95ef5f56d87491, 2016-03-14T15:53:23Z
```

Useful for keeping track of which version you're actually interacting
with in your browser.

## Prerequisites

This middleware assumes that you have activated the `runtime-dyno-metadata`
labs feature on Heroku which adds ENV variables containing Heroku
release metadata. Enable it for your app using the Heroku CLI:

```
heroku labs:enable runtime-dyno-metadata -a <appname>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "heroku-headers"
```

And then execute:

    $ bundle

## Usage

If you add the gem to a Rails app the middleware will be added automatically
via a Railtie initializer.

If you're not on rails you'll have to manually add the `HerokuHeaders::Middleware`
class to your middleware chain.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mynewsdesk/heroku-headers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
