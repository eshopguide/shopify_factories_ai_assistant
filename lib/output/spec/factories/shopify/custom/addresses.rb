# frozen_string_literal: true

FactoryBot.define do
  factory :address, class: Hash do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address1 { Faker::Address.street_address }
    province_code { Faker::Address.state_abbr }
    city { Faker::Address.city }
    zip { Faker::Address.zip }
    name { Faker::Name.name }
    country_code { 'DE' }
    company { nil }

    initialize_with { attributes.stringify_keys }
  end

  trait :with_company do
    company { Faker::Company.name }
  end

  trait :EEA_Country do
    country_code { 'NO' }
  end

  trait :Switzerland do
    country_code { 'CH' }
  end

  trait :USA do
    country_code { 'US' }
  end
end
