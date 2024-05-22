#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_gift_card, class: 'ShopifyAPI::GiftCard' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    initial_value { FFaker::Random.rand(10..500).to_s }
    currency { FFaker::Currency.code }
    code { FFaker::Internet.password }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    expires_on { FFaker::Time.date + 365 }
    disabled_at { nil }
    customer_id { FFaker::Random.rand(1..1000) }
    user_id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    line_item_id { FFaker::Random.rand(1..1000) }
    note { FFaker::Lorem.sentence }

    # Associations
    balance { association :shopify_balance }
    currency { association :shopify_currency }

    # Traits
    trait :expired do
      expires_on { FFaker::Time.date - 30 }
      disabled_at { FFaker::Time.date - 29 }
    end

    trait :active do
      expires_on { FFaker::Time.date + 365 }
      disabled_at { nil }
    end

    trait :disabled do
      disabled_at { FFaker::Time.date }
    end
  end
end