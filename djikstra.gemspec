# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'djikstra/version'

Gem::Specification.new do |spec|
  spec.name          = "djikstra"
  spec.version       = Djikstra::VERSION
  spec.authors       = ["diebels727"]
  spec.email         = ["diebelsalternative@hotmail.com"]
  spec.summary       = %q{Implementation of Djikstra's SPF algorithm.}
  spec.description   = %q{Given a graph input file describing a weighted DAG, this library calculates the shortest path between a start and end vertex.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
