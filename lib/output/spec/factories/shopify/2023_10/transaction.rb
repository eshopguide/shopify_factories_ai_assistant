```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_transaction, class: 'ShopifyAPI::Transaction' do
    kind { %w[sale authorization capture void refund].sample }
    amount { FFaker::Number.decimal }
    authorization { FFaker::Lorem.characters(10) }
    authorization_expires_at { FFaker::Time.datetime }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    currency_exchange_adjustment { { old_amount: FFaker::Number.decimal, new_amount: FFaker::Number.decimal } }
    device_id { FFaker::Random.rand(1..1000) }
    error_code { FFaker::Lorem.characters(5) }
    extended_authorization_attributes { { extended_authorization: true, extended_authorization_expires_at: FFaker::Time.datetime } }
    gateway { FFaker::Payment.card_type }
    id { FFaker::Random.rand(1..1000) }
    location_id { FFaker::Random.rand(1..1000) }
    message { FFaker::Lorem.sentence }
    order_id { FFaker::Random.rand(1..1000) }
    parent_id { FFaker::Random.rand(1..1000) }
    payment_details { { credit_card_bin: FFaker::Finance.credit_card, avs_result_code: FFaker::Lorem.characters(3), cvv_result_code: FFaker::Lorem.characters(3) } }
    payments_refund_attributes { { refund_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal } }
    processed_at { FFaker::Time.datetime }
    receipt { { receipt_id: FFaker::Random.rand(1..1000), receipt_url: FFaker::Internet.http_url } }
    source_name { %w[web pos].sample }
    status { %w[pending success failure].sample }
    test { FFaker::Boolean.random }
    total_unsettled_set { { amount: FFaker::Number.decimal, currency: FFaker::Currency.code } }
    user_id { FFaker::Random.rand(1..1000) }

    trait :sale do
      kind { 'sale' }
    end

    trait :authorization do
      kind { 'authorization' }
    end

    trait :capture do
      kind { 'capture' }
    end

    trait :void do
      kind { 'void' }
    end

    trait :refund do
      kind { 'refund' }
    end

    trait :pending do
      status { 'pending' }
    end

    trait :success do
      status { 'success' }
    end

    trait :failure do
      status { 'failure' }
    end

    trait :test_mode do
      test { true }
    end

    trait :live_mode do
      test { false }
    end
  end
end
```