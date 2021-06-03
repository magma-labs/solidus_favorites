# frozen_string_literal: true

module Spree
  module StoreHelperDecorator
    def favorite_count
      try_spree_current_user.favorites.count || 0
    end

    def get_favorite(object)
      try_spree_current_user.favorites.find_by(
        favorable_id: object.id,
        favorable_type: object.class.to_s
      )
    end

    def favorite?(object)
      try_spree_current_user&.favorite?(object)
    end

    ::Spree::StoreHelper.prepend(self)
  end
end
