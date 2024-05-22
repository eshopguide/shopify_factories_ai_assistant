```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payment, class: 'ShopifyAPI::Payment' do
    credit_card { { number: FFaker::Finance.credit_card, name: FFaker::Name.name, expiry_month: FFaker::Random.rand(1..12), expiry_year: FFaker::Random.rand(2023..2030), cvv: FFaker::Random.rand(100..999) } }
    id { FFaker::Random.rand(1..1000) }
    next_action { { type: %w[redirect capture].sample, url: FFaker::Internet.http_url } }
    payment_processing_error_message { FFaker::Lorem.sentence }
    unique_token { FFaker::Lorem.characters(10) }

    association :checkout, factory: :shopify_checkout
    association :transaction, factory: :shopify_transaction

    trait :with_error do
      payment_processing_error_message { FFaker::Lorem.sentence }
    end

    trait :without_error do
      payment_processing_error_message { nil }
    end

    trait :with_next_action do
      next_action { { type: %w[redirect capture].sample, url: FFaker::Internet.http_url } }
    end

    trait :without_next_action do
      next_action { nil }
    end
  end
end
```