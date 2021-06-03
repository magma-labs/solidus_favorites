# frozen_string_literal: true

module SolidusFavorites
  module FavoritesHelper
    def favorite_price(favorite, options)
      if ::Spree.solidus_gem_version < Gem::Version.new('3.1')
        favorite&.favorable&.price_for(options)
      else
        favorite&.favorable&.price_for_options(options)&.money
      end
    end
  end
end
