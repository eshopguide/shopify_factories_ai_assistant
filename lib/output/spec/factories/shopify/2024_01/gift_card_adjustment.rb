#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_gift_card_adjustment, class: 'ShopifyAPI::GiftCardAdjustment' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    gift_card_id { FFaker::Random.rand(1..1000) }
    amount { FFaker::Random.rand(10.0..100.0).round(2) }
    created_at { FFaker::Time.date }
    processed_at { FFaker::Time.date }
    note { FFaker::Lorem.sentence }
    user_id { FFaker::Random.rand(1..1000) }
    order_transaction_id { FFaker::Random.rand(1..1000) }
    remote_transaction_ref { FFaker::Lorem.characters(10) }
    remote_transaction_url { FFaker::Internet.http_url }

    # Traits
    trait :with_high_amount do
      amount { FFaker::Random.rand(100.0..500.0).round(2) }
    end

    trait :with_low_amount do
      amount { FFaker::Random.rand(1.0..10.0).round(2) }
    end
  end
end