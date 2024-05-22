#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment, class: 'ShopifyAPI::Fulfillment' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    location_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    status { ['pending', 'open', 'success', 'cancelled', 'error'].sample }
    tracking_number { FFaker::Vehicle.vin }
    tracking_company { FFaker::Company.name }
    tracking_url { FFaker::Internet.http_url }
    shipment_status { ['ready', 'pending', 'shipped', 'delivered', 'failure'].sample }
    notify_customer { FFaker::Boolean.random }
    service { ['standard', 'express', 'overnight'].sample }

    # Hash attributes
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    receipt { { testcase: true, authorization: FFaker::Lorem.word } }

    # Array attributes
    line_items { [{ title: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10), price: FFaker::Random.rand(10..100).to_s }] }
    tracking_numbers { [FFaker::Vehicle.vin, FFaker::Vehicle.vin] }
    tracking_urls { [FFaker::Internet.http_url, FFaker::Internet.http_url] }

    # Traits
    trait :with_multiple_tracking_numbers do
      tracking_numbers { Array.new(3) { FFaker::Vehicle.vin } }
      tracking_urls { Array.new(3) { FFaker::Internet.http_url } }
    end

    trait :without_tracking do
      tracking_number { nil }
      tracking_company { nil }
      tracking_url { nil }
      tracking_numbers { [] }
      tracking_urls { [] }
    end
  end
end