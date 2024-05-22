#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_service, class: 'ShopifyAPI::FulfillmentService' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Company.name }
    handle { FFaker::Internet.user_name }
    callback_url { FFaker::Internet.http_url }
    provider_id { FFaker::Lorem.word }
    location_id { FFaker::Random.rand(1..1000) }
    tracking_support { FFaker::Boolean.random }
    inventory_management { FFaker::Boolean.random }
    requires_shipping_method { FFaker::Boolean.random }
    fulfillment_orders_opt_in { FFaker::Boolean.random }
    permits_sku_sharing { FFaker::Boolean.random }

    # Traits
    trait :with_tracking_support do
      tracking_support { true }
    end

    trait :without_tracking_support do
      tracking_support { false }
    end

    trait :with_inventory_management do
      inventory_management { true }
    end

    trait :without_inventory_management do
      inventory_management { false }
    end
  end
end