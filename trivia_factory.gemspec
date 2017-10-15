# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trivia_factory/version"

Gem::Specification.new do |spec|
  spec.name          = "trivia_factory"
  spec.version       = TriviaFactory::VERSION
  spec.authors       = ["Callmeed"]
  spec.email         = ["erik.dungan@gmail.com"]

  spec.summary       = %q{A trivia question generator for use in specs or sample applications.}
  spec.description   = %q{If you have an app that does testing or trivia, use this to create sample/dummy/fake questions. Its like Faker for questions.}
  spec.homepage      = "https://github.com/callmeed/trivia_factory"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
