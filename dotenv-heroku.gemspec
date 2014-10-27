# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dotenv-heroku/version'

Gem::Specification.new do |spec|
  spec.name          = "dotenv-heroku"
  spec.version       = Dotenv::Heroku::VERSION
  spec.authors       = ["Philipp Fehre"]
  spec.email         = ["philipp.fehre@gmail.com"]
  spec.summary       = %q{Manage your heroku environment with dotenv}
  spec.description   = %q{Tasks to manage your heroku environment with dotenv}
  spec.homepage      = "https://github.com/sideshowcoder/dotenv-heroku"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_dependency "rake"
end
