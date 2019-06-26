# frozen_string_literal: true

require 'spec_helper'

describe 'Favorites Index Page', type: :feature, js: true do
  let!(:product) { create(:product) }
  let!(:user) { create(:user) }
  let!(:favorite) { create(:favorite, favorable: product, user: user) }

  before do
    allow_any_instance_of(Spree::FavoritesController).
      to receive_messages(try_spree_current_user: user)
  end

  context 'as User' do
    before do
      visit spree.favorites_path
    end

    it 'should allow removing favorites' do
      expect(page).to have_content(product.name)
      click_link 'Remove'
      expect(page).not_to have_content(product.name)
    end
  end
end
