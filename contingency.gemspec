# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contingency/version'

Gem::Specification.new do |spec|
  spec.name          = "contingency"
  spec.version       = Contingency::VERSION
  spec.authors       = ["Christopher Keele"]
  spec.email         = ["dev@chriskeele.com"]
  spec.description   = "A framework agnostic exception catcher and custom error page generator."
  spec.summary       = "Handle your ruby web application's errors your way, with your own beautiful customized error pages. Framework agnostic with several integrations and i18n support."
  # spec.homepage      = ""
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
