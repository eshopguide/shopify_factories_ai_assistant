```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment, class: 'ShopifyAPI::Fulfillment' do
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    line_items { build_list(:shopify_line_item, 3) }
    location_id { FFaker::Random.rand(1..1000) }
    name { FFaker::Lorem.word }
    notify_customer { FFaker::Boolean.random }
    order_id { FFaker::Random.rand(1..1000) }
    origin_address { [{ address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country }] }
    receipt { { test_case: FFaker::Lorem.word } }
    service { FFaker::Lorem.word }
    shipment_status { %w[confirmed in_transit out_for_delivery delivered].sample }
    status { %w[pending success failure].sample }
    tracking_company { FFaker::Company.name }
    tracking_number { FFaker::Lorem.characters(10) }
    tracking_numbers { [FFaker::Lorem.characters(10), FFaker::Lorem.characters(10)] }
    tracking_url { FFaker::Internet.http_url }
    tracking_urls { [FFaker::Internet.http_url, FFaker::Internet.http_url] }
    updated_at { FFaker::Time.datetime }
    variant_inventory_management { FFaker::Lorem.word }

    trait :pending do
      status { 'pending' }
    end

    trait :success do
      status { 'success' }
    end

    trait :failure do
      status { 'failure' }
    end

    trait :with_tracking_info do
      tracking_company { FFaker::Company.name }
      tracking_number { FFaker::Lorem.characters(10) }
      tracking_url { FFaker::Internet.http_url }
    end
  end
end
```