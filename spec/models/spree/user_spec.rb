# frozen_string_literal: true

RSpec.describe Spree::User do
  it { is_expected.to respond_to(:favorites) }
  it { is_expected.to respond_to(:favorite_products) }

  describe '.favorite?' do
    let(:user) { create(:user) }
    let(:product1) { create(:product) }
    let(:product2) { create(:product) }
    let(:favorite) { create(:favorite, favorable: product1) }

    before { user.favorites << favorite }

    context "when product in user's favorite products" do
      it { expect(user.reload.favorite?(product1)).to be(true) }
    end

    context 'when product is not in users favorite products' do
      it { expect(user.reload.favorite?(product2)).to be(false) }
    end
  end
end
