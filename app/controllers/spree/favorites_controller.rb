# frozen_string_literal: true

module Spree
  class FavoritesController < Spree::StoreController
    helper SolidusFavorites::FavoritesHelper

    before_action :favorite, only: [:destroy]

    respond_to :html, :js

    def index
      @favorites = try_spree_current_user.favorites
                                         .page(params[:page])
                                         .per(SolidusFavorites::Config.favorites_per_page) || []
    end

    def create
      @favorite = try_spree_current_user.favorites.new(favorite_params)

      if @favorite.save
        flash.now[:success] = t('spree.successfully_added_favorite')
      else
        flash.now[:error] = @favorite.errors.full_messages.to_sentence
      end

      respond_with(&:js)
    end

    def destroy
      if @favorite&.destroy
        flash.now[:success] = t('spree.favorite_successfully_removed')
      else
        flash.now[:error] = t('spree.favorite_unsuccessfully_removed')
      end

      respond_with(&:js)
    end

    private

    def favorite
      @favorite ||= try_spree_current_user.favorites.find(params[:id])
    end

    def favorite_params
      params.permit(:favorable_id, :favorable_type, :variant_id)
    end

    def model_class
      Spree::Favorite
    end
  end
end
