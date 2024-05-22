# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payout, class: 'ShopifyAPI::Payout' do
    amount { FFaker::Number.decimal }
    currency { FFaker::Currency.code }
    date { FFaker::Time.date }
    id { FFaker::Random.rand(1..1000) }
    status { %w[pending paid failed].sample }

    trait :pending do
      status { 'pending' }
    end

    trait :paid do
      status { 'paid' }
    end

    trait :failed do
      status { 'failed' }
    end

    trait :with_high_amount do
      amount { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_amount do
      amount { FFaker::Number.decimal(l_digits: 1) }
    end
  end
end