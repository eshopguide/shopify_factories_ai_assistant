#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_metafield, class: 'ShopifyAPI::Metafield' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    namespace { 'global' }
    key { 'description' }
    value { FFaker::Lorem.sentence }
    type { 'string' }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }

    # Optional attributes for different resources
    trait :for_product do
      product_id { FFaker::Random.rand(1..1000) }
    end

    trait :for_variant do
      variant_id { FFaker::Random.rand(1..1000) }
    end

    trait :for_order do
      order_id { FFaker::Random.rand(1..1000) }
    end

    trait :for_customer do
      customer_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_integer_value do
      value { FFaker::Random.rand(1..100) }
      type { 'integer' }
    end

    trait :with_boolean_value do
      value { FFaker::Boolean.random }
      type { 'boolean' }
    end
  end
end