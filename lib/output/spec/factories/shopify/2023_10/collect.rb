```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_collect, class: 'ShopifyAPI::Collect' do
    collection_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    position { FFaker::Random.rand(1..100) }
    product_id { FFaker::Random.rand(1..1000) }
    sort_value { FFaker::Lorem.word }
    updated_at { FFaker::Time.datetime }

    trait :with_high_position do
      position { FFaker::Random.rand(51..100) }
    end

    trait :with_low_position do
      position { FFaker::Random.rand(1..50) }
    end
  end
end
```