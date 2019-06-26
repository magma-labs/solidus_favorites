module SolidusFavorites
  module ProductDecorator
    extend ActiveSupport::Concern

    included do
      prepend(InstanceMethods)
      has_many :favorites, as: :favorable
      has_many :favorite_users, through: :favorites, class_name: 'Spree::User', source: 'user'

      def self.favorite
        joins(:favorites).uniq
      end
    end

    module InstanceMethods
      def to_cart_params
        {}
      end
    end
  end
end
