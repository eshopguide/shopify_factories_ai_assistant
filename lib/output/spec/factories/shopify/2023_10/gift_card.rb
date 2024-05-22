```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_gift_card, class: 'ShopifyAPI::GiftCard' do
    api_client_id { FFaker::Random.rand(1..1000) }
    code { FFaker::Lorem.characters(16) }
    created_at { FFaker::Time.datetime }
    customer_id { FFaker::Random.rand(1..1000) }
    disabled_at { FFaker::Time.datetime }
    expires_on { FFaker::Time.date }
    id { FFaker::Random.rand(1..1000) }
    initial_value { FFaker::Number.decimal }
    last_characters { FFaker::Lorem.characters(4) }
    line_item_id { FFaker::Random.rand(1..1000) }
    note { FFaker::Lorem.sentence }
    order_id { FFaker::Random.rand(1..1000) }
    template_suffix { FFaker::Lorem.word }
    updated_at { FFaker::Time.datetime }
    user_id { FFaker::Random.rand(1..1000) }

    association :balance, factory: :shopify_balance
    association :currency, factory: :shopify_currency

    trait :disabled do
      disabled_at { FFaker::Time.datetime }
    end

    trait :active do
      disabled_at { nil }
    end

    trait :with_note do
      note { FFaker::Lorem.sentence }
    end
  end
end
```