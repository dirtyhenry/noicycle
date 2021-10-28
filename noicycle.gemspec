# frozen_string_literal: true

require 'English'

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noicycle/version'

Gem::Specification.new do |spec|
  spec.name          = 'noicycle'
  spec.version       = Noicycle::VERSION
  spec.authors       = ['Mick F']
  spec.email         = ['mick@mickf.net']
  spec.description   = 'Provide Tower of Hanoi backup rotation method dates'
  spec.summary       = 'Utility gem to calculate dates involved in a Tower of Hanoi backup rotation method'
  spec.homepage      = 'http://dirtyhenry.github.io/noicycle/'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
end
