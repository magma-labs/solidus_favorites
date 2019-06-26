# frozen_string_literal: true

require 'spec_helper'

describe Spree::FavoritesController, type: :controller do
  let(:product) { create(:product) }
  let(:favorite) { create(:favorite) }
  let(:user) do
    user = create(:user)
    user.favorites << favorite
    user
  end

  before do
    allow(controller).to receive_messages(try_spree_current_user: user)
  end

  context '#create' do
    context 'when invalid' do
      it 'fails' do
        post :create, params: { id: 1, type: 'Spree::Order' }, format: :js
        expect(flash.now[:error]).to match('Favorable type is not included in the list')
      end
    end

    context 'when valid' do
      before do
        post :create, params: { favorable_id: product.id, favorable_type: 'Spree::Product' }, format: :js
      end

      context 'when favorite saved successfully' do
        it 'renders create' do
          expect(response.status).to eq(200)
          expect(response).to render_template(:create)
        end

        it 'should assign success message' do
          expect(flash.now[:success]).to match('Successfully added favorite.')
        end
      end
    end
  end

  describe '#index' do
    before do
      expect(SolidusFavorites::Config).
        to receive(:favorites_per_page).and_return(10)
    end

    it 'returns 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#destroy' do
    it 'destroyed successfully' do
      post :destroy, params: { id: favorite.id }, format: :js
      expect(response.status).to eq(200)
    end

    it 'not destroyed' do
      allow(favorite).to receive(:destroy).and_return(false)
      post :destroy, params: { id: favorite.id }, format: :js

      expect(response.status).to eq(200)
      expect(favorite.persisted?).to be(true)
    end
  end
end
