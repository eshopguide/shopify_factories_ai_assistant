# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_application_credit, class: 'ShopifyAPI::ApplicationCredit' do
    amount { FFaker::Number.decimal }
    description { FFaker::Lorem.sentence }
    test { FFaker::Boolean.random }

    association :currency, factory: :shopify_currency

    trait :test_mode do
      test { true }
    end
  end
end