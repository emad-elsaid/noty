# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noty/version'

Gem::Specification.new do |spec|
  spec.name          = "noty"
  spec.version       = Noty::VERSION
  spec.authors       = ["Emad Elsaid"]
  spec.email         = ["emad.elsaid@blacklane.com"]

  spec.summary       = %q{Terminal storage for bookmarks or snippets}
  spec.description   = File.read('README.md')
  spec.homepage      = "https://www.github.com/blazeeboy/noty"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
