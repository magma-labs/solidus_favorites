# frozen_string_literal: true

module Spree
  module StoreHelperDecorator
    def favorite_count
      try_spree_current_user.favorites.count || 0
    end

    def get_favorite(object)
      try_spree_current_user.favorites.find_by_favorable_id_and_favorable_type(
        object.id, object.class.to_s
      )
    end

    def has_favorite?(object)
      try_spree_current_user&.has_favorite?(object)
    end

    ::Spree::StoreHelper.prepend(self)
  end
end
