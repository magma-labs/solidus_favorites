# frozen_string_literal: true

module SolidusFavorites
  class Configuration < Spree::Preferences::Configuration
    preference :favorites_per_page, :integer, default: 10
  end
end
