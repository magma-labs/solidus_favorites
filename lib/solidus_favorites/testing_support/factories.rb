# frozen_string_literal: true

FactoryBot.define do
  factory :favorite, class: Spree::Favorite do
    favorable { create(:product) }
    user
  end
end
