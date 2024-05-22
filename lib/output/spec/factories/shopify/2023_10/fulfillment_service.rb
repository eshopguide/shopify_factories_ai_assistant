```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_service, class: 'ShopifyAPI::FulfillmentService' do
    admin_graphql_api_id { FFaker::Lorem.characters(10) }
    callback_url { FFaker::Internet.http_url }
    fulfillment_orders_opt_in { FFaker::Boolean.random }
    handle { FFaker::Lorem.word }
    id { FFaker::Random.rand(1..1000) }
    inventory_management { FFaker::Boolean.random }
    location_id { FFaker::Random.rand(1..1000) }
    name { FFaker::Company.name }
    permits_sku_sharing { FFaker::Boolean.random }
    provider_id { FFaker::Lorem.characters(10) }
    requires_shipping_method { FFaker::Boolean.random }
    tracking_support { FFaker::Boolean.random }

    trait :with_inventory_management do
      inventory_management { true }
    end

    trait :without_inventory_management do
      inventory_management { false }
    end

    trait :with_tracking_support do
      tracking_support { true }
    end

    trait :without_tracking_support do
      tracking_support { false }
    end
  end
end
```