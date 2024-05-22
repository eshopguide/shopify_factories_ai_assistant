#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_event, class: 'ShopifyAPI::FulfillmentEvent' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    fulfillment_id { FFaker::Random.rand(1..1000) }
    status { ['confirmed', 'in_transit', 'out_for_delivery', 'delivered', 'failure'].sample }
    happened_at { FFaker::Time.date }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    message { FFaker::Lorem.sentence }
    latitude { FFaker::Geolocation.lat }
    longitude { FFaker::Geolocation.lng }

    # Hash attributes
    address1 { FFaker::Address.street_address }
    city { FFaker::Address.city }
    zip { FFaker::Address.zip_code }
    province { association :shopify_province }
    country { association :shopify_country }

    # Traits
    trait :delivered do
      status { 'delivered' }
      message { 'Package delivered successfully.' }
    end

    trait :in_transit do
      status { 'in_transit' }
      message { 'Package is on the way.' }
    end
  end
end