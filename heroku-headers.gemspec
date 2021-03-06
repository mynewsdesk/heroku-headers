# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heroku-headers/version'

Gem::Specification.new do |spec|
  spec.name          = "heroku-headers"
  spec.version       = Heroku::Headers::VERSION
  spec.authors       = ["David Backeus"]
  spec.email         = ["duztdruid@gmail.com"]

  spec.summary       = %q{Add heroku release info to your response headers.}
  spec.homepage      = "https://github.com/dbackeus/heroku-headers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
