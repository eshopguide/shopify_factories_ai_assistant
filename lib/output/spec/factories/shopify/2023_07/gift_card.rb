# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_gift_card, class: 'ShopifyAPI::GiftCard' do
    api_client_id { FFaker::Random.rand(1..1000) }
    code { FFaker::Lorem.characters(10) }
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

    trait :with_high_initial_value do
      initial_value { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_initial_value do
      initial_value { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :disabled do
      disabled_at { FFaker::Time.datetime }
    end

    trait :not_disabled do
      disabled_at { nil }
    end
  end
end