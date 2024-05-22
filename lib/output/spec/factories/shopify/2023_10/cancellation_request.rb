# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_cancellation_request, class: 'ShopifyAPI::CancellationRequest' do
    fulfillment_order_id { FFaker::Random.rand(1..1000) }

    trait :with_specific_order_id do
      fulfillment_order_id { 12345 }
    end
  end
end