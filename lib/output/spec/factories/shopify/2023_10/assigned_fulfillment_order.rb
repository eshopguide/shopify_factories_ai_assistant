# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_assigned_fulfillment_order, class: 'ShopifyAPI::AssignedFulfillmentOrder' do
    assigned_location_id { FFaker::Random.rand(1..1000) }
    destination { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    line_items { [{ item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) }] }
    order_id { FFaker::Random.rand(1..1000) }
    request_status { %w[accepted rejected pending].sample }
    shop_id { FFaker::Random.rand(1..1000) }
    status { %w[open closed cancelled].sample }

    trait :accepted do
      request_status { 'accepted' }
    end

    trait :rejected do
      request_status { 'rejected' }
    end

    trait :pending do
      request_status { 'pending' }
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