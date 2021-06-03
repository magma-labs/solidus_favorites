# frozen_string_literal: true

RSpec.describe Spree::Product do
  it { is_expected.to respond_to(:favorites) }
  it { is_expected.to respond_to(:favorite_users) }

  describe '.favorite' do
    let!(:shipping_category) { create(:shipping_category) }
    let!(:favorite_product1) do
      create(:product, shipping_category: shipping_category)
    end
    let!(:favorite_product2) do
      create(:product, shipping_category: shipping_category)
    end
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }

    before do
      user1.favorites.create(favorable: favorite_product1)
      user2.favorites.create(favorable: favorite_product1)
      user2.favorites.create(favorable: favorite_product2)
    end

    it 'returns favorite products' do
      expect(described_class.favorite.count).to be(2)
    end
  end
end
