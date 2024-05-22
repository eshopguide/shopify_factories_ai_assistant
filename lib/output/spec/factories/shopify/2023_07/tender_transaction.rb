# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_tender_transaction, class: 'ShopifyAPI::TenderTransaction' do
    amount { FFaker::Number.decimal }
    currency { FFaker::Currency.code }
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    payment_details { { credit_card_number: FFaker::Finance.credit_card, credit_card_company: FFaker::Finance.card_type } }
    payment_method { %w[credit_card debit_card cash].sample }
    processed_at { FFaker::Time.datetime }
    remote_reference { FFaker::Lorem.characters(10) }
    test { FFaker::Boolean.random }
    user_id { FFaker::Random.rand(1..1000) }

    trait :with_high_amount do
      amount { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_amount do
      amount { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :test_mode do
      test { true }
    end

    trait :live_mode do
      test { false }
    end
  end
end