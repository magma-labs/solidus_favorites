# frozen_string_literal: true

RSpec.describe SolidusFavorites::Configuration do
  it 'can be instantiated' do
    expect { described_class.new }.not_to raise_error
  end

  it 'allows registering custom events' do
    configuration = described_class.new
    configuration.favorites_per_page = 5
    expect(configuration.favorites_per_page).to eq(5)
  end
end
