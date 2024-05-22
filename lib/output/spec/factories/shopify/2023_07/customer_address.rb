# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_customer_address, class: 'ShopifyAPI::CustomerAddress' do
    address1 { FFaker::Address.street_address }
    address2 { FFaker::Address.secondary_address }
    city { FFaker::Address.city }
    company { FFaker::Company.name }
    country { FFaker::Address.country }
    country_code { FFaker::Address.country_code }
    country_name { FFaker::Address.country }
    customer_id { FFaker::Random.rand(1..1000) }
    first_name { FFaker::Name.first_name }
    id { FFaker::Random.rand(1..1000) }
    last_name { FFaker::Name.last_name }
    name { "#{first_name} #{last_name}" }
    phone { FFaker::PhoneNumber.phone_number }
    province { FFaker::AddressUS.state }
    province_code { FFaker::AddressUS.state_abbr }
    zip { FFaker::AddressUS.zip_code }

    trait :with_company do
      company { FFaker::Company.name }
    end

    trait :without_company do
      company { nil }
    end

    trait :with_secondary_address do
      address2 { FFaker::Address.secondary_address }
    end

    trait :without_secondary_address do
      address2 { nil }
    end
  end
end