# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_shipping_zone, class: 'ShopifyAPI::ShippingZone' do
    carrier_shipping_rate_providers { [{ provider: FFaker::Company.name, service: FFaker::Lorem.word }] }
    countries { [{ id: FFaker::Random.rand(1..1000), name: FFaker::Address.country }] }
    id { FFaker::Random.rand(1..1000) }
    location_group_id { FFaker::Lorem.characters(10) }
    name { FFaker::Lorem.word }
    price_based_shipping_rates { [{ rate: FFaker::Number.decimal, min_price: FFaker::Number.decimal, max_price: FFaker::Number.decimal }] }
    profile_id { FFaker::Lorem.characters(10) }
    provinces { [{ id: FFaker::Random.rand(1..1000), name: FFaker::AddressUS.state }] }
    weight_based_shipping_rates { [{ rate: FFaker::Number.decimal, min_weight: FFaker::Number.decimal, max_weight: FFaker::Number.decimal }] }

    association :countries, factory: :shopify_country
    association :provinces, factory: :shopify_province

    trait :with_multiple_countries do
      countries { Array.new(3) { { id: FFaker::Random.rand(1..1000), name: FFaker::Address.country } } }
    end

    trait :with_multiple_provinces do
      provinces { Array.new(3) { { id: FFaker::Random.rand(1..1000), name: FFaker::AddressUS.state } } }
    end

    trait :with_multiple_price_based_shipping_rates do
      price_based_shipping_rates { Array.new(3) { { rate: FFaker::Number.decimal, min_price: FFaker::Number.decimal, max_price: FFaker::Number.decimal } } }
    end

    trait :with_multiple_weight_based_shipping_rates do
      weight_based_shipping_rates { Array.new(3) { { rate: FFaker::Number.decimal, min_weight: FFaker::Number.decimal, max_weight: FFaker::Number.decimal } } }
    end
  end
end