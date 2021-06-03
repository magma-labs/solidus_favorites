# frozen_string_literal: true

RSpec.describe Spree::Favorite do
  subject { create(:favorite) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:user) }

  describe 'scopes' do
    let(:favorite1) { create(:favorite, guest_token: 'test') }
    let(:favorite2) { create(:favorite, guest_token: 'invalid') }
    let(:favorite3) { create(:favorite) }
    let(:favorite4) { create(:favorite, guest_token: 'test') }
    let(:favorite5) { create(:favorite, guest_token: 'invalid') }

    it '.by_guest_token' do
      expect(described_class.by_guest_token('test')).
        to match_array([favorite1, favorite4])
    end
  end
end
