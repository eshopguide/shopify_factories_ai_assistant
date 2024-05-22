# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_inventory_level, class: 'ShopifyAPI::InventoryLevel' do
    available { FFaker::Random.rand(1..1000) }
    inventory_item_id { FFaker::Random.rand(1..1000) }
    location_id { FFaker::Random.rand(1..1000) }
    updated_at { FFaker::Time.datetime }

    trait :with_high_availability do
      available { FFaker::Random.rand(1001..5000) }
    end

    trait :with_low_availability do
      available { FFaker::Random.rand(1..100) }
    end
  end
end