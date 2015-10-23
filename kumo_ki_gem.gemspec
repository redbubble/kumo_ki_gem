# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kumo_ki_gem/version'

Gem::Specification.new do |spec|
  spec.name          = 'kumo_ki_gem'
  spec.version       = KumoKiGem::VERSION
  spec.authors       = ['Redbubble Delivery Engineering']
  spec.email         = ['developers@redbubble.com']
  spec.summary       = %q{Gem for accessing secrets in Amazon's Key Management Service}
  spec.homepage      = 'github.com/redbubble'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
end
