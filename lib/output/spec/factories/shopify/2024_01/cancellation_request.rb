#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_cancellation_request, class: 'ShopifyAPI::CancellationRequest' do
    # Basic attributes
    fulfillment_order_id { FFaker::Random.rand(1..1000) }
  end
end