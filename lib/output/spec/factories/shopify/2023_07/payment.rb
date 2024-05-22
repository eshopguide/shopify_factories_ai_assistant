# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payment, class: 'ShopifyAPI::Payment' do
    credit_card { { number: FFaker::Finance.credit_card, name: FFaker::Name.name, expiry: FFaker::Time.date } }
    id { FFaker::Random.rand(1..1000) }
    next_action { { type: %w[redirect capture].sample, url: FFaker::Internet.http_url } }
    payment_processing_error_message { FFaker::Lorem.sentence }
    unique_token { FFaker::Lorem.characters(10) }

    association :transaction, factory: :shopify_transaction
    association :checkout, factory: :shopify_checkout

    trait :with_error do
      payment_processing_error_message { FFaker::Lorem.sentence }
    end

    trait :without_error do
      payment_processing_error_message { nil }
    end

    trait :with_redirect_action do
      next_action { { type: 'redirect', url: FFaker::Internet.http_url } }
    end

    trait :with_capture_action do
      next_action { { type: 'capture', url: FFaker::Internet.http_url } }
    end
  end
end