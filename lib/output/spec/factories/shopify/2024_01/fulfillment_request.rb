#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_request, class: 'ShopifyAPI::FulfillmentRequest' do
    # Basic attributes
    fulfillment_order_id { FFaker::Random.rand(1..1000) }

    # Traits
    trait :with_message do
      transient do
        message { "Please expedite this fulfillment." }
      end

      after(:build) do |fulfillment_request, evaluator|
        fulfillment_request.class_eval do
          params(message: evaluator.message)
        end
      end
    end

    trait :with_rejection_reason do
      transient do
        reason { "Out of stock" }
      end

      after(:build) do |fulfillment_request, evaluator|
        fulfillment_request.class_eval do
          params(reason: evaluator.reason)
        end
      end
    end
  end
end