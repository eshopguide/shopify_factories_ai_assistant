#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_customer_address, class: 'ShopifyAPI::CustomerAddress' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    customer_id { FFaker::Random.rand(1..1000) }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address1 { FFaker::Address.street_address }
    address2 { FFaker::Address.secondary_address }
    city { FFaker::Address.city }
    province { FFaker::Address.state }
    province_code { FFaker::Address.state_abbr }
    country { FFaker::Address.country }
    country_code { FFaker::Address.country_code }
    zip { FFaker::Address.zip_code }
    phone { FFaker::PhoneNumber.phone_number }
    company { FFaker::Company.name }

    # Traits
    trait :with_full_details do
      address2 { FFaker::Address.secondary_address }
      company { FFaker::Company.name }
    end

    trait :without_secondary_address do
      address2 { nil }
    end
  end
end