# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_gift_card_adjustment, class: 'ShopifyAPI::GiftCardAdjustment' do
    amount { FFaker::Number.decimal }
    api_client_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.datetime }
    gift_card_id { FFaker::Random.rand(1..1000) }
    id { FFaker::Random.rand(1..1000) }
    note { FFaker::Lorem.sentence }
    number { FFaker::Random.rand(1..1000) }
    order_transaction_id { FFaker::Random.rand(1..1000) }
    processed_at { FFaker::Time.datetime }
    remote_transaction_ref { FFaker::Lorem.characters(10) }
    remote_transaction_url { FFaker::Internet.http_url }
    user_id { FFaker::Random.rand(1..1000) }

    trait :with_high_amount do
      amount { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_amount do
      amount { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :processed do
      processed_at { FFaker::Time.datetime }
    end

    trait :not_processed do
      processed_at { nil }
    end
  end
end