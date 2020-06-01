# frozen_string_literal: true

module Spree
  module ProductDecorator
    def self.prepended(klass)
      klass.has_many :favorites, as: :favorable
      klass.has_many :favorite_users, through: :favorites, class_name: 'Spree::User', source: 'user'

      def klass.favorite
        joins(:favorites).uniq
      end
    end

    def to_cart_params
      {}
    end

    ::Spree::Product.prepend(self)
  end
end
