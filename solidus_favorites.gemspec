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

  s.add_dependency 'solidus', ['>= 2.0', '< 3']
  s.add_dependency 'solidus_auth_devise', ['>= 2.0', '< 3']
  s.add_dependency 'solidus_support'
  s.add_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'solidus_dev_support'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
