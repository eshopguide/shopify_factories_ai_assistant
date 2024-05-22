# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_price_rule, class: 'ShopifyAPI::PriceRule' do
    allocation_limit { FFaker::Random.rand(1..100) }
    allocation_method { %w[each all].sample }
    created_at { FFaker::Time.datetime }
    customer_segment_prerequisite_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    customer_selection { %w[all prerequisite].sample }
    ends_at { FFaker::Time.datetime }
    entitled_collection_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    entitled_country_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    entitled_product_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    entitled_variant_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    id { FFaker::Random.rand(1..1000) }
    once_per_customer { FFaker::Boolean.random }
    prerequisite_collection_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    prerequisite_customer_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    prerequisite_product_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    prerequisite_quantity_range { { greater_than_or_equal_to: FFaker::Random.rand(1..10) } }
    prerequisite_shipping_price_range { { less_than_or_equal_to: FFaker::Number.decimal } }
    prerequisite_subtotal_range { { greater_than_or_equal_to: FFaker::Number.decimal } }
    prerequisite_to_entitlement_purchase { { prerequisite_amount: FFaker::Number.decimal, entitled_amount: FFaker::Number.decimal } }
    prerequisite_to_entitlement_quantity_ratio { { prerequisite_quantity: FFaker::Random.rand(1..10), entitled_quantity: FFaker::Random.rand(1..10) } }
    prerequisite_variant_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    starts_at { FFaker::Time.datetime }
    target_selection { %w[all entitled].sample }
    target_type { %w[line_item shipping_line].sample }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }
    usage_limit { FFaker::Random.rand(1..100) }
    value { FFaker::Number.decimal }
    value_type { %w[fixed_amount percentage].sample }

    trait :with_high_allocation_limit do
      allocation_limit { FFaker::Random.rand(101..200) }
    end

    trait :with_low_allocation_limit do
      allocation_limit { FFaker::Random.rand(1..50) }
    end

    trait :once_per_customer do
      once_per_customer { true }
    end

    trait :multiple_per_customer do
      once_per_customer { false }
    end

    trait :with_high_usage_limit do
      usage_limit { FFaker::Random.rand(101..200) }
    end

    trait :with_low_usage_limit do
      usage_limit { FFaker::Random.rand(1..50) }
    end
  end
end