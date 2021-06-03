# frozen_string_literal: true

module SolidusFavorites
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.has_many :favorites,
          class_name: 'Spree::Favorite'
        base.has_many :favorite_products,
          through: :favorites,
          class_name: 'Spree::Product',
          source: :favorable,
          source_type: 'Spree::Product'
      end

      def favorite?(object)
        favorites.exists?(
          favorable_id: object.id,
          favorable_type: object.class.to_s
        )
      end

      ::Spree::User.prepend(self)
    end
  end
end
