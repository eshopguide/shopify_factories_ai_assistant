# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_discount_code, class: 'ShopifyAPI::DiscountCode' do
    code { FFaker::Lorem.characters(10) }
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    price_rule_id { FFaker::Random.rand(1..1000) }
    updated_at { FFaker::Time.datetime }
    usage_count { FFaker::Random.rand(1..100) }

    trait :with_errors do
      errors { { message: FFaker::Lorem.sentence } }
    end

    trait :high_usage do
      usage_count { FFaker::Random.rand(101..500) }
    end

    trait :low_usage do
      usage_count { FFaker::Random.rand(1..10) }
    end
  end
end