```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_recurring_application_charge, class: 'ShopifyAPI::RecurringApplicationCharge' do
    activated_on { FFaker::Time.date }
    billing_on { FFaker::Time.date }
    cancelled_on { FFaker::Time.date }
    capped_amount { FFaker::Number.decimal }
    confirmation_url { FFaker::Internet.http_url }
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Product.product_name }
    price { FFaker::Number.decimal }
    return_url { FFaker::Internet.http_url }
    status { %w[active pending cancelled].sample }
    terms { FFaker::Lorem.sentence }
    test { FFaker::Boolean.random }
    trial_days { FFaker::Random.rand(1..30) }
    trial_ends_on { FFaker::Time.date }
    updated_at { FFaker::Time.datetime }

    association :currency, factory: :shopify_currency

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
      trial_days { FFaker::Random.rand(1..30) }
      trial_ends_on { FFaker::Time.date }
    end

    trait :without_trial do
      trial_days { 0 }
      trial_ends_on { nil }
    end
  end
end
```