```ruby
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

    trait :with_note do
      note { FFaker::Lorem.sentence }
    end

    trait :with_remote_transaction do
      remote_transaction_ref { FFaker::Lorem.characters(10) }
      remote_transaction_url { FFaker::Internet.http_url }
    end
  end
end
```