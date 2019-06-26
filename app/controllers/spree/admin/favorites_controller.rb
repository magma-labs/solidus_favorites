module Spree
  module Admin
    class FavoritesController < Spree::Admin::BaseController
      def index
        @favorites = Spree::Product.joins(:favorites).page(params[:page]).
          per(SolidusFavorites::Config.favorites_per_page)
      end

      def users
        @product = Spree::Product.where(id: params[:id]).first
        @users = @product.favorite_users.page(params[:page]).
          per(SolidusFavorites::Config.favorites_per_page)
      end
    end
  end
end
