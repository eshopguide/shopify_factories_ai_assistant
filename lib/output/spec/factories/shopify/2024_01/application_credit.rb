#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_application_credit, class: 'ShopifyAPI::ApplicationCredit' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    amount { FFaker::Random.rand(10.0..1000.0).round(2).to_s }
    description { FFaker::Lorem.sentence }
    
    # Boolean attributes
    test { FFaker::Boolean.random }

    # Associations
    currency { association :shopify_currency }

    # Traits
    trait :test_mode do
      test { true }
    end

    trait :live_mode do
      test { false }
    end
  end
end