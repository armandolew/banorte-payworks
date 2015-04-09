# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'banorte/payworks/version'

Gem::Specification.new do |spec|
  spec.name          = "banorte-payworks"
  spec.version       = Banorte::Payworks::VERSION
  spec.authors       = ["Ricardo Echavarria"]
  spec.email         = ["rgechavarria@gmail.com"]
  spec.summary       = "Gem to use Banorte Payworks Service"
  spec.description   = "This gem provides an easy api for Banorte payment services Payworks"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
