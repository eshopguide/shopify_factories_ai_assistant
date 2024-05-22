```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_metafield, class: 'ShopifyAPI::Metafield' do
    key { FFaker::Lorem.word }
    namespace { FFaker::Lorem.word }
    value { FFaker::Lorem.sentence }
    created_at { FFaker::Time.datetime }
    description { FFaker::Lorem.sentence }
    id { FFaker::Random.rand(1..1000) }
    owner_id { FFaker::Random.rand(1..1000) }
    owner_resource { %w[product variant order customer].sample }
    type { %w[string integer json].sample }
    updated_at { FFaker::Time.datetime }

    trait :for_product do
      owner_resource { 'product' }
      product_id { FFaker::Random.rand(1..1000) }
    end

    trait :for_variant do
      owner_resource { 'variant' }
      variant_id { FFaker::Random.rand(1..1000) }
    end

    trait :for_order do
      owner_resource { 'order' }
      order_id { FFaker::Random.rand(1..1000) }
    end

    trait :for_customer do
      owner_resource { 'customer' }
      customer_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_description do
      description { FFaker::Lorem.sentence }
    end
  end
end
```