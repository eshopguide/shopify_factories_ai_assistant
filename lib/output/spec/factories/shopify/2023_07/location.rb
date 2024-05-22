# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_location, class: 'ShopifyAPI::Location' do
    active { FFaker::Boolean.random }
    address1 { FFaker::Address.street_address }
    address2 { FFaker::Address.secondary_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    country_code { FFaker::Address.country_code }
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    legacy { FFaker::Boolean.random }
    localized_country_name { FFaker::Address.country }
    localized_province_name { FFaker::AddressUS.state }
    name { FFaker::Company.name }
    phone { FFaker::PhoneNumber.phone_number }
    province { FFaker::AddressUS.state }
    province_code { FFaker::AddressUS.state_abbr }
    updated_at { FFaker::Time.datetime }
    zip { FFaker::AddressUS.zip_code }

    trait :active do
      active { true }
    end

    trait :inactive do
      active { false }
    end

    trait :with_secondary_address do
      address2 { FFaker::Address.secondary_address }
    end

    trait :without_secondary_address do
      address2 { nil }
    end

    trait :legacy do
      legacy { true }
    end

    trait :not_legacy do
      legacy { false }
    end
  end
end