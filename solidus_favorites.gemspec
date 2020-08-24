# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solidus_favorites/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_favorites'
  s.version     = SolidusFavorites::VERSION
  s.summary     = 'Allows the user to mark/unkmark a product as favorite from the product page'
  s.description = s.summary
  s.license     = 'BSD-3-Clause'

  s.author    = 'Jonathan Tapia'
  s.email     = 'jonathan.tapia@magmalabs.io'
  s.homepage  = 'http://github.com/jtapia/solidus_favorites'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core', ['>= 2.0', '< 3']
  s.add_dependency 'solidus_auth_devise', ['>= 2.0', '< 3']
  s.add_dependency 'solidus_support'
  s.add_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'sass-rails'
  # s.add_development_dependency 'solidus_dev_support'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'

  s.add_development_dependency 'apparition', '~> 0.4'
  s.add_development_dependency 'capybara', '~> 3.29'
  s.add_development_dependency 'capybara-screenshot', '~> 1.0'
  s.add_development_dependency 'codecov', '~> 0.2'
  s.add_development_dependency 'database_cleaner', '~> 1.7'
  s.add_development_dependency 'factory_bot_rails', '~> 5.1'
  s.add_development_dependency 'ffaker', '~> 2.13'
  s.add_development_dependency 'gem-release', '~> 2.1'
  s.add_development_dependency 'github_changelog_generator', '~> 1.15'
  s.add_development_dependency 'puma', '~> 4.3'
  s.add_development_dependency 'rspec_junit_formatter'
  s.add_development_dependency 'rspec-rails', '~> 4.0.0.beta3'
  s.add_development_dependency 'rubocop', '~> 0.87.1'
  s.add_development_dependency 'rubocop-performance', '~> 1.5'
  s.add_development_dependency 'rubocop-rails', '~> 2.3'
  s.add_development_dependency 'rubocop-rspec', '~> 1.36'
  s.add_development_dependency 'solidus_core', ['>= 2.0', '< 3']
end
