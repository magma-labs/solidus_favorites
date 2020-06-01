# frozen_string_literal: true

require 'spree/core'

module SolidusFavorites
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree
    engine_name 'solidus_favorites'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_favorites.environment', before: :load_config_initializers do
      SolidusFavorites::Config = SolidusFavorites::Configuration.new
    end
  end
end
