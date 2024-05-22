# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_event, class: 'ShopifyAPI::FulfillmentEvent' do
    address1 { FFaker::Address.street_address }
    city { FFaker::Address.city }
    created_at { FFaker::Time.datetime }
    estimated_delivery_at { FFaker::Time.datetime }
    fulfillment_id { FFaker::Random.rand(1..1000) }
    happened_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    latitude { FFaker::Geolocation.lat }
    longitude { FFaker::Geolocation.lng }
    message { FFaker::Lorem.sentence }
    order_id { FFaker::Random.rand(1..1000) }
    shop_id { FFaker::Random.rand(1..1000) }
    status { %w[in_transit out_for_delivery delivered attempted_delivery].sample }
    updated_at { FFaker::Time.datetime }
    zip { FFaker::AddressUS.zip_code }

    association :country, factory: :shopify_country
    association :province, factory: :shopify_province

    trait :in_transit do
      status { 'in_transit' }
    end

    trait :out_for_delivery do
      status { 'out_for_delivery' }
    end

    trait :delivered do
      status { 'delivered' }
    end

    trait :attempted_delivery do
      status { 'attempted_delivery' }
    end
  end
end