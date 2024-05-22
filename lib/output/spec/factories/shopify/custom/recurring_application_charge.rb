# frozen_string_literal: true

FactoryBot.define do
  factory :recurring_application_charge, class: ShopifyAPI::RecurringApplicationCharge do
    activated_on { Faker::Date.backward(days: 14) }
    billing_on { Faker::Date.forward(days: 30) }
    cancelled_on { nil }
    capped_amount { Faker::Number.number(digits: 3) }
    confirmation_url { Faker::Internet.url }
    created_at { Faker::Date.backward(days: 14) }
    currency
    id { Faker::Number.number(digits: 5) }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 0..100.0, as_string: true) }
    return_url { Faker::Internet.url }
    status { %w[active pending cancelled accepted declined].sample }
    terms { Faker::Lorem.sentence(word_count: 3) }
    test { [true, false].sample }
    trial_days { Faker::Number.between(from: 1, to: 30) }
    trial_ends_on { Faker::Date.forward(days: 30) }
    updated_at { Faker::Date.backward(days: 7) }
  end

  factory :currency, class: ShopifyAPI::Currency do
    currency { Faker::Currency.code }
    rate_updated_at { Faker::Date.backward(days: 14) }
  end
end
