# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noicycle/version'

Gem::Specification.new do |spec|
  spec.name          = "noicycle"
  spec.version       = Noicycle::VERSION
  spec.authors       = ["Mickaël Floc'hlay"]
  spec.email         = ["dirtyhenry@gmail.com"]
  spec.description   = %q{Provide Tower of Hanoi backup rotation method dates"}
  spec.summary       = %q{Utility gem to calculate dates involved in a Tower of Hanoi backup rotation method}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end