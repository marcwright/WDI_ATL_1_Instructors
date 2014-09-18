# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hello_world/version'

Gem::Specification.new do |spec|
  spec.name          = "hello_world"
  spec.version       = HelloWorld::VERSION
  spec.authors       = ["Michael Pavling"]
  spec.email         = ["pavling@gmail.com"]
  spec.description   = %q{This gem can say Hello in more than 100 languages}
  spec.summary       = %q{No idea what to put here...}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
