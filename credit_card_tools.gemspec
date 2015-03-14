# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card_tools/version'

Gem::Specification.new do |spec|
  spec.name          = 'credit_card_tools'
  spec.version       = CreditCardTools::VERSION
  spec.authors       = ['Luis Daher']
  spec.email         = ['luisotaviodaher@gmail.com']
  spec.description   = 'A gem that provides tools for credit card handling'
  spec.summary       = spec.description
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{/^bin/i}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{/^(test|spec|features)/i})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency 'pry', '~> 0.10', '>= 0.10.1'
  spec.add_development_dependency 'rubocop', '~> 0.28', '>= 0.28.0'
end
