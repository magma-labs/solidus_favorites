# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |name| "https://github.com/#{name}.git" }

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'solidus_auth_devise'

if branch == 'master' || branch >= 'v2.0'
  gem 'rails-controller-testing', group: :test
end

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 0.21'
end

group :development, :test do
  gem 'factory_bot', (branch < 'v2.5' ? '4.10.0' : '> 4.10.0')
  gem 'pry-rails'
  gem 'byebug'
end

gemspec
