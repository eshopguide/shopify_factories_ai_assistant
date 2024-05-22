#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_price_rule, class: 'ShopifyAPI::PriceRule' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    title { "Discount #{FFaker::Product.brand}" }
    value_type { ['fixed_amount', 'percentage'].sample }
    value { value_type == 'percentage' ? "#{FFaker::Random.rand(5..25)}%" : "#{FFaker::Random.rand(5..50)}.00" }
    target_type { ['line_item', 'shipping_line'].sample }
    target_selection { ['all', 'entitled'].sample }
    allocation_method { ['across', 'each'].sample }
    customer_selection { ['all', 'prerequisite'].sample }
    starts_at { FFaker::Time.date }
    ends_at { FFaker::Time.date + 30 }
    usage_limit { FFaker::Random.rand(1..100) }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }

    # Array attributes
    entitled_product_ids { Array.new(FFaker::Random.rand(1..5)) { FFaker::Random.rand(1..1000) } }
    prerequisite_product_ids { Array.new(FFaker::Random.rand(1..3)) { FFaker::Random.rand(1..1000) } }

    # Traits
    trait :with_fixed_amount do
      value_type { 'fixed_amount' }
      value { "#{FFaker::Random.rand(5..50)}.00" }
    end

    trait :with_percentage do
      value_type { 'percentage' }
      value { "#{FFaker::Random.rand(5..25)}%" }
    end

    trait :for_shipping_lines do
      target_type { 'shipping_line' }
    end

    trait :for_line_items do
      target_type { 'line_item' }
    end
  end
end