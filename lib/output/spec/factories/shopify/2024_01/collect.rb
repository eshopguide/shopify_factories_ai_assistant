#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_collect, class: 'ShopifyAPI::Collect' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    collection_id { FFaker::Random.rand(1..1000) }
    product_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    position { FFaker::Random.rand(1..10) }
    sort_value { FFaker::Lorem.word }

    # Traits
    trait :recent do
      created_at { FFaker::Time.date }
    end

    trait :older do
      created_at { FFaker::Time.date - 365 }
    end
  end
end