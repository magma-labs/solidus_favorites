# frozen_string_literal: true

require 'spec_helper'

describe Spree::Product do
  it { is_expected.to respond_to(:favorites) }
  it { is_expected.to respond_to(:favorite_users) }

  describe '.favorite' do
    let(:shipping_category) { create(:shipping_category) }
    let(:favorite_product1) { create(:product,
      shipping_category: shipping_category) }
    let(:favorite_product2) { create(:product,
      shipping_category: shipping_category) }
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    before do
      user1.favorites.create(favorable: favorite_product1)
      user2.favorites.create(favorable: favorite_product1)
      user2.favorites.create(favorable: favorite_product2)
    end

    it 'returns favorite products' do
      expect(Spree::Product.favorite).
        to match([favorite_product1, favorite_product2])
    end
  end
end
