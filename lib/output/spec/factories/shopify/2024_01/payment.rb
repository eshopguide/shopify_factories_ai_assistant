#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payment, class: 'ShopifyAPI::Payment' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    unique_token { FFaker::Internet.password(min_length: 10, max_length: 20) }
    payment_processing_error_message { FFaker::Lorem.sentence }

    # Associations
    checkout { association :shopify_checkout }
    transaction { association :shopify_transaction }

    # Hash attributes for credit card and next action
    credit_card { { brand: 'Visa', last4: '4242', expiry_month: 12, expiry_year: 2024 } }
    next_action { { type: 'redirect', url: FFaker::Internet.http_url } }

    # Traits
    trait :with_credit_card do
      credit_card { { brand: 'Mastercard', last4: '1234', expiry_month: 6, expiry_year: 2023 } }
    end

    trait :with_error_message do
      payment_processing_error_message { 'Insufficient funds' }
    end
  end
end