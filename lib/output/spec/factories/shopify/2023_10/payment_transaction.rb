```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payment_transaction, class: 'ShopifyAPI::PaymentTransaction' do
    adjustment_order_transactions { [{ id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal }] }
    amount { FFaker::Number.decimal }
    fee { FFaker::Number.decimal }
    id { FFaker::Random.rand(1..1000) }
    net { FFaker::Number.decimal }
    payout_id { FFaker::Random.rand(1..1000) }
    payout_status { %w[pending paid failed].sample }
    processed_at { FFaker::Time.datetime }
    source_id { FFaker::Random.rand(1..1000) }
    source_order_id { FFaker::Random.rand(1..1000) }
    source_order_transaction_id { FFaker::Lorem.characters(10) }
    source_type { %w[order refund].sample }
    test { FFaker::Boolean.random }
    type { %w[sale refund].sample }

    association :currency, factory: :shopify_currency

    trait :test_mode do
      test { true }
    end

    trait :live_mode do
      test { false }
    end

    trait :pending_payout do
      payout_status { 'pending' }
    end

    trait :paid_payout do
      payout_status { 'paid' }
    end

    trait :failed_payout do
      payout_status { 'failed' }
    end
  end
end
```