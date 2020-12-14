# frozen_string_literal: true

$LOAD_PATH.unshift "#{__dir__}/lib"

require 'lucid/shopify/session/version'

Gem::Specification.new do |s|
  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'rubocop', '~> 0.89'
  s.add_runtime_dependency 'jwt', '~> 2.2'
  s.add_runtime_dependency 'lucid-shopify', '~> 0.64'
  s.author = 'Kelsey Judson'
  s.email = 'kelsey@kelseyjudson.dev'
  s.files = Dir.glob('lib/**/*') + %w(README.md)
  s.homepage = 'https://github.com/kj/lucid-shopify-session'
  s.license = 'ISC'
  s.name = 'lucid-shopify-session'
  s.summary = 'Shopify client library session token helpers for embedded apps'
  s.version = Lucid::Shopify::Session::VERSION
end
