#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_location, class: 'ShopifyAPI::Location' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Company.name }
    address1 { FFaker::Address.street_address }
    address2 { FFaker::Address.secondary_address }
    city { FFaker::Address.city }
    province { FFaker::Address.state }
    province_code { FFaker::Address.state_abbr }
    country { FFaker::Address.country }
    country_code { FFaker::Address.country_code }
    zip { FFaker::Address.zip_code }
    phone { FFaker::PhoneNumber.phone_number }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    active { FFaker::Boolean.random }
    legacy { FFaker::Boolean.random }

    # Traits
    trait :active do
      active { true }
    end

    trait :inactive do
      active { false }
    end

    trait :legacy do
      legacy { true }
    end

    trait :modern do
      legacy { false }
    end
  end
end