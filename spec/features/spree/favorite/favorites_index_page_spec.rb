# frozen_string_literal: true

RSpec.describe 'Favorites Index Page', type: :feature, js: true do
  stub_authorization!

  let(:product) { create(:product) }
  let(:user) { create(:user) }
  let!(:favorite) { create(:favorite, favorable: product, user: user) }

  before do
    allow_any_instance_of(Spree::FavoritesController).to receive(
      :try_spree_current_user
    ) { user }
  end

  context 'with user' do
    before do
      visit spree.favorites_path
    end

    it 'allows removing favorites' do
      expect(page).to have_content(product.name)
      click_link 'Remove'
      expect(page).not_to have_content(product.name)
    end
  end
end
