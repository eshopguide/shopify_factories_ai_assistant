# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_order, class: 'ShopifyAPI::FulfillmentOrder' do
    assigned_location { { name: FFaker::Company.name, address: FFaker::Address.street_address } }
    assigned_location_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.datetime }
    delivery_method { { method: %w[standard express].sample, price: FFaker::Number.decimal } }
    destination { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    fulfill_at { FFaker::Time.datetime }
    fulfill_by { FFaker::Time.datetime }
    fulfillment_holds { [{ reason: FFaker::Lorem.sentence }] }
    id { FFaker::Random.rand(1..1000) }
    international_duties { { duty: FFaker::Number.decimal, tax: FFaker::Number.decimal } }
    line_items { [{ item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) }] }
    merchant_requests { [{ request: FFaker::Lorem.sentence }] }
    order_id { FFaker::Random.rand(1..1000) }
    request_status { %w[pending accepted rejected].sample }
    shop_id { FFaker::Random.rand(1..1000) }
    status { %w[open closed cancelled].sample }
    supported_actions { %w[hold release move].sample }
    updated_at { FFaker::Time.datetime }

    trait :with_multiple_line_items do
      line_items { Array.new(3) { { item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) } } }
    end

    trait :with_high_priority do
      fulfill_by { FFaker::Time.datetime + 1.day }
    end

    trait :with_low_priority do
      fulfill_by { FFaker::Time.datetime + 1.week }
    end

    trait :pending do
      request_status { 'pending' }
    end

    trait :accepted do
      request_status { 'accepted' }
    end

    trait :rejected do
      request_status { 'rejected' }
    end

    trait :open do
      status { 'open' }
    end

    trait :closed do
      status { 'closed' }
    end

    trait :cancelled do
      status { 'cancelled' }
    end
  end
end