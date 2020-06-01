require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/controller_requests'
# require 'solidus_support/extension/feature_helper'
require 'spree/config'

RSpec.configure do |config|
  config.include Spree::TestingSupport::UrlHelpers
  config.extend Spree::TestingSupport::ControllerRequests, type: :controller
  config.extend Spree::TestingSupport::AuthorizationHelpers::Controller, type: :controller
  config.extend Spree::TestingSupport::AuthorizationHelpers::Request, type: :feature
end
