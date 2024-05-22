# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_request, class: 'ShopifyAPI::FulfillmentRequest' do
    fulfillment_order_id { FFaker::Random.rand(1..1000) }

    trait :with_high_id do
      fulfillment_order_id { FFaker::Random.rand(1001..2000) }
    end

    trait :with_low_id do
      fulfillment_order_id { FFaker::Random.rand(1..500) }
    end
  end
end