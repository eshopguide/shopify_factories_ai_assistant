# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_application_charge, class: 'ShopifyAPI::ApplicationCharge' do
    confirmation_url { FFaker::Internet.http_url }
    created_at { FFaker::Time.datetime }
    name { FFaker::Product.product_name }
    price { FFaker::Number.decimal }
    return_url { FFaker::Internet.http_url }
    status { %w[pending accepted declined].sample }
    test { FFaker::Boolean.random }
    updated_at { FFaker::Time.datetime }

    association :currency, factory: :shopify_currency

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
  end
end