$:.push File.expand_path("../lib", __FILE__)

require "grpc-api-assistant/version"

Gem::Specification.new do |spec|
  spec.name = "cucumber-grpc-api-assistant"
  spec.version = GrpcApiAssistant::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors = ["Garrett Cramer", "Eric Kaun", "Michael Keeling", "Michael Lipschultz"]
  spec.email = ["mkeeling@neverletdown.net"]

  spec.summary = %q{A set of Cucumber steps for testing gRPC services}
  spec.description = %q{A set of Cucumber steps for testing gRPC services.}
  spec.homepage = "https://github.com/michaelkeeling/cucumber-grpc-api-assistant"

  spec.files = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.5.7'
  spec.license = 'MIT'

  spec.add_dependency('grpc', '~> 1.38')
  spec.add_dependency('grpc-tools', '~> 1.40')
  spec.add_dependency('net-ssh', '~> 6.1')

  spec.add_dependency('cucumber', '~> 7.0')
  spec.add_dependency('rspec-expectations', '~> 3.10')

  spec.add_development_dependency('rake', '~> 13.0')
  spec.add_development_dependency('yard', '~> 0.9')
  spec.add_development_dependency('yard-cucumber', '~> 2.2')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('pry-byebug')
end
