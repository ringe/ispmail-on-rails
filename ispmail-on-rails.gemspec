# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ispmail/on/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "ispmail-on-rails"
  spec.version       = Ispmail::On::Rails::VERSION
  spec.authors       = ["Runar Ingebrigtsen"]
  spec.email         = ["runar@rin.no"]

  spec.summary       = %q{Rails app to manage ISPMAIL}
  spec.description   = %q{This Rails app is a web admin interface for https://workaround.org/ispmail/jessie/}
  spec.homepage      = "http://github.com/ringe/ispmail-on-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
