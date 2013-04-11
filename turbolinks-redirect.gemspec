# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turbolinks/redirect/version'

Gem::Specification.new do |spec|
  spec.name          = "turbolinks-redirect"
  spec.version       = Turbolinks::Redirect::VERSION
  spec.authors       = ["Jeremy Ruppel"]
  spec.email         = ["jeremy.ruppel@gmail.com"]
  spec.description   = %q{Simple redirect_to support for Turbolinks.}
  spec.summary       = %q{Simple redirect_to support for Turbolinks.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'railties'
  spec.add_dependency 'turbolinks'
  spec.add_dependency 'jquery-rails'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
