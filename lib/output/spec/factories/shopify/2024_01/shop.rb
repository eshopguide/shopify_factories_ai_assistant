#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_shop, class: 'ShopifyAPI::Shop' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Company.name }
    email { FFaker::Internet.email }
    domain { "#{FFaker::Internet.domain_name}" }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    timezone { "Eastern Time (US & Canada)" }
    iana_timezone { "America/New_York" }
    shop_owner { FFaker::Name.name }
    address1 { FFaker::Address.street_address }
    city { FFaker::Address.city }
    province { FFaker::Address.state }
    country { "United States" }
    zip { FFaker::Address.zip_code }
    phone { FFaker::PhoneNumber.phone_number }
    currency { "USD" }
    money_format { "${{amount}}" }
    money_with_currency_format { "${{amount}} USD" }
    eligible_for_payments { FFaker::Boolean.random }
    eligible_for_card_reader_giveaway { FFaker::Boolean.random }
    force_ssl { true }
    taxes_included { FFaker::Boolean.random }
    has_storefront { true }
    has_discounts { FFaker::Boolean.random }
    has_gift_cards { FFaker::Boolean.random }

    # Traits
    trait :with_features do
      has_discounts { true }
      has_gift_cards { true }
    end

    trait :without_features do
      has_discounts { false }
      has_gift_cards { false }
    end

    trait :eligible_for_payments do
      eligible_for_payments { true }
    end

    trait :not_eligible_for_payments do
      eligible_for_payments { false }
    end
  end
end