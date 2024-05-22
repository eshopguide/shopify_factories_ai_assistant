#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_recurring_application_charge, class: 'ShopifyAPI::RecurringApplicationCharge' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { "Basic Plan" }
    price { FFaker::Random.rand(10.0..100.0).round(2).to_s }
    status { ['pending', 'active', 'cancelled', 'expired'].sample }
    terms { "Billing occurs every 30 days." }
    trial_days { FFaker::Random.rand(0..30) }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    test { FFaker::Boolean.random }
    capped_amount { FFaker::Random.rand(100..1000).to_s }
    return_url { FFaker::Internet.http_url }
    confirmation_url { FFaker::Internet.http_url }

    # Associations
    currency { association :shopify_currency }

    # Traits
    trait :active do
      status { 'active' }
    end

    trait :pending do
      status { 'pending' }
    end

    trait :cancelled do
      status { 'cancelled' }
    end

    trait :with_trial do
      trial_days { 14 }
    end

    trait :without_trial do
      trial_days { 0 }
    end
  end
end