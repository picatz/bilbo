# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bilbo/version'

Gem::Specification.new do |spec|
  spec.name          = "bilbo"
  spec.version       = Bilbo::VERSION
  spec.authors       = ["Kent 'picat' Gruber"]
  spec.email         = ["kgruber1@emich.edu"]

  spec.summary       = %q{A simple, hobbit-like network packet capturing gem.}
  spec.description   = %q{You never know when you're going need a simple, hobbit-like ( small ) network packet burglaring ( capturing ) library such as Bilbo.}
  spec.homepage      = "https://github.com/picatz/bilbo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'pcaprub', '~>0.12.4'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
