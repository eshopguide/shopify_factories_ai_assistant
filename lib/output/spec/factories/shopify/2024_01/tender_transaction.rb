#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_tender_transaction, class: 'ShopifyAPI::TenderTransaction' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    amount { FFaker::Random.rand(10.0..1000.0).round(2).to_s }
    currency { FFaker::Currency.code }
    payment_method { ['credit_card', 'paypal', 'shop_pay', 'apple_pay'].sample }
    processed_at { FFaker::Time.date }
    remote_reference { FFaker::Lorem.characters(10) }
    test { FFaker::Boolean.random }
    user_id { FFaker::Random.rand(1..1000) }

    # Hash attributes for payment details
    payment_details { { credit_card_bin: FFaker::Bank.card_number, avs_result_code: 'Y', cvv_result_code: 'N', credit_card_number: "•••• •••• •••• #{FFaker::Random.rand(1000..9999)}", credit_card_company: 'Visa' } }

    # Traits
    trait :with_test_mode do
      test { true }
    end

    trait :with_real_mode do
      test { false }
    end

    trait :with_credit_card do
      payment_method { 'credit_card' }
      payment_details { { credit_card_bin: FFaker::Bank.card_number, avs_result_code: 'Y', cvv_result_code: 'N', credit_card_number: "•••• •••• •••• #{FFaker::Random.rand(1000..9999)}", credit_card_company: 'Visa' } }
    end

    trait :with_paypal do
      payment_method { 'paypal' }
      payment_details { { payer_id: FFaker::Internet.user_name, transaction_id: FFaker::Lorem.characters(10), payment_status: 'Completed' } }
    end
  end
end