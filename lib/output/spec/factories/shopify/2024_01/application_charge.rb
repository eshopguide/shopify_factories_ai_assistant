#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_application_charge, class: 'ShopifyAPI::ApplicationCharge' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Product.product_name }
    price { FFaker::Random.rand(1.0..100.0).round(2) }
    status { ['pending', 'accepted', 'declined'].sample }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    confirmation_url { FFaker::Internet.http_url }
    return_url { FFaker::Internet.http_url }

    # Boolean attributes
    test { FFaker::Boolean.random }

    # Associations
    currency { association :shopify_currency }

    # Traits
    trait :pending do
      status { 'pending' }
    end

    trait :accepted do
      status { 'accepted' }
    end

    trait :declined do
      status { 'declined' }
    end

    trait :test_mode do
      test { true }
    end

    trait :live_mode do
      test { false }
    end
  end
end