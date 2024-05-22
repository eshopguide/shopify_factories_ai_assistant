#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_discount_code, class: 'ShopifyAPI::DiscountCode' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    price_rule_id { FFaker::Random.rand(1..1000) }
    code { FFaker::Internet.password }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    usage_count { FFaker::Random.rand(0..100) }

    # Traits
    trait :with_high_usage do
      usage_count { FFaker::Random.rand(50..100) }
    end

    trait :with_low_usage do
      usage_count { FFaker::Random.rand(0..10) }
    end
  end
end