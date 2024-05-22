```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_request, class: 'ShopifyAPI::FulfillmentRequest' do
    fulfillment_order_id { FFaker::Random.rand(1..1000) }

    trait :accepted do
      after(:build) do |fulfillment_request|
        fulfillment_request.accept(message: FFaker::Lorem.sentence)
      end
    end

    trait :rejected do
      after(:build) do |fulfillment_request|
        fulfillment_request.reject(message: FFaker::Lorem.sentence, reason: FFaker::Lorem.word)
      end
    end
  end
end
```