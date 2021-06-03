# frozen_string_literal: true

module SolidusFavorites
  class Configuration < Spree::Preferences::Configuration
    preference :favorites_per_page, :integer, default: 10
  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    alias config configuration

    def configure
      yield configuration
    end
  end
end
