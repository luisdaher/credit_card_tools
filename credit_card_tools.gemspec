# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "credit_card_tools"
  spec.version       = CreditCardTools::VERSION
  spec.authors       = ["Luis Daher"]
  spec.email         = ["luisotaviodaher@gmail.com"]
  spec.description   = %q{A gem that provides tools for credit card handling}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"  
end
