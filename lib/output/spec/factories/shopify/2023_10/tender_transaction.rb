```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_tender_transaction, class: 'ShopifyAPI::TenderTransaction' do
    amount { FFaker::Number.decimal }
    currency { FFaker::Currency.code }
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    payment_details { { credit_card_bin: FFaker::Finance.credit_card, avs_result_code: FFaker::Lorem.characters(3), cvv_result_code: FFaker::Lorem.characters(3) } }
    payment_method { %w[credit_card cash].sample }
    processed_at { FFaker::Time.datetime }
    remote_reference { FFaker::Lorem.characters(10) }
    test { FFaker::Boolean.random }
    user_id { FFaker::Random.rand(1..1000) }

    trait :credit_card do
      payment_method { 'credit_card' }
    end

    trait :cash do
      payment_method { 'cash' }
    end

    trait :test_mode do
      test { true }
    end

    trait :live_mode do
      test { false }
    end

    trait :with_payment_details do
      payment_details { { credit_card_bin: FFaker::Finance.credit_card, avs_result_code: FFaker::Lorem.characters(3), cvv_result_code: FFaker::Lorem.characters(3) } }
    end
  end
end
```