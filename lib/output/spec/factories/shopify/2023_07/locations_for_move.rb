# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_locations_for_move, class: 'ShopifyAPI::LocationsForMove' do
    locations_for_move { [{ location_id: FFaker::Random.rand(1..1000), name: FFaker::Company.name, address: FFaker::Address.street_address }] }

    trait :with_multiple_locations do
      locations_for_move { Array.new(3) { { location_id: FFaker::Random.rand(1..1000), name: FFaker::Company.name, address: FFaker::Address.street_address } } }
    end
  end
end