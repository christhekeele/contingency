# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'penny_wise/version'

Gem::Specification.new do |spec|
  spec.name          = "penny_wise"
  spec.version       = PennyWise::VERSION
  spec.authors       = ["Christopher Keele"]
  spec.email         = ["dev@chriskeele.com"]
  spec.description   = "Easily render customized error pages."
  spec.summary       = "Don't let pennies on the track derail your user experience. Handle all exceptions, big or small, with your own beautiful customized error pages. Framework agnostic with several integrations, supports i18n."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport",  ">= 3.0.0"
  spec.add_dependency "i18n",           ">= 0.6.0"
  spec.add_dependency "rake",           ">= 0.8.0"

  spec.add_development_dependency "bundler",  "~> 1.3"
  spec.add_development_dependency "rspec",    "~> 2.13"
end
