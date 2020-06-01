# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'rspec/rails'

Dir[File.join(File.dirname(__FILE__), '/support/**/*.rb')].each { |file| require file }

require 'solidus_favorites/factories'
require 'spree/testing_support/controller_requests'

RSpec.configure do |config|
  config.include Spree::TestingSupport::ControllerRequests, type: :controller
  config.extend Spree::TestingSupport::AuthorizationHelpers, type: :feature
end
