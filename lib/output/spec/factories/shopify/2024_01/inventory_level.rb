#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_inventory_level, class: 'ShopifyAPI::InventoryLevel' do
    # Basic attributes
    inventory_item_id { FFaker::Random.rand(1..1000) }
    location_id { FFaker::Random.rand(1..1000) }
    available { FFaker::Random.rand(0..100) }
    updated_at { FFaker::Time.date }

    # Traits
    trait :with_high_availability do
      available { FFaker::Random.rand(100..1000) }
    end

    trait :with_low_availability do
      available { FFaker::Random.rand(0..10) }
    end
  end
end