# frozen_string_literal: true

RSpec.describe Spree::Admin::FavoritesController, type: :controller do
  let(:role) { Spree::Role.create!(name: 'user') }
  let(:user) { create(:user) }
  let(:roles) { [role] }
  let(:product) do
    product = create(:product)
    product.favorite_users << user
    product
  end

  stub_authorization!

  describe '#index' do
    it 'returns 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#users' do
    it 'fetches the users who marked the product as favorite' do
      get :users, params: { id: product.id }, format: :js
      expect(response).to have_http_status(:ok)
    end
  end
end
