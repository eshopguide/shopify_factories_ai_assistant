#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payment_transaction, class: 'ShopifyAPI::PaymentTransaction' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    amount { FFaker::Random.rand(10.0..1000.0).round(2).to_s }
    fee { FFaker::Random.rand(0.5..50.0).round(2).to_s }
    net { (amount.to_f - fee.to_f).round(2).to_s }
    processed_at { FFaker::Time.date }
    type { ['authorization', 'capture', 'sale', 'refund'].sample }
    test { FFaker::Boolean.random }
    payout_status { ['scheduled', 'paid', 'failed', 'cancelled'].sample }

    # Associations
    currency { association :shopify_currency }

    # Traits
    trait :test_transaction do
      test { true }
    end

    trait :live_transaction do
      test { false }
    end

    trait :refunded do
      type { 'refund' }
    end

    trait :captured do
      type { 'capture' }
    end
  end
end