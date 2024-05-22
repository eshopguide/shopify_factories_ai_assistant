#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_customer, class: 'ShopifyAPI::Customer' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    phone { FFaker::PhoneNumber.phone_number }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    accepts_marketing { FFaker::Boolean.random }
    accepts_marketing_updated_at { FFaker::Time.date }
    currency { FFaker::Currency.code }
    note { FFaker::Lorem.sentence }
    state { ['enabled', 'disabled', 'invited', 'declined'].sample }
    verified_email { FFaker::Boolean.random }
    total_spent { FFaker::Random.rand(100..10000).to_s }
    orders_count { FFaker::Random.rand(1..100) }
    tax_exempt { FFaker::Boolean.random }

    # Hash attributes
    default_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    email_marketing_consent { { state: 'subscribed', opt_in_level: 'single_opt_in', consent_updated_at: FFaker::Time.date } }
    sms_marketing_consent { { state: 'subscribed', opt_in_level: 'single_opt_in', consent_updated_at: FFaker::Time.date } }

    # Array attributes
    addresses { [{ address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country }] }
    tax_exemptions { ['exempt_all', 'exempt_ps', 'exempt_vat'].sample(2) }

    # Associations
    metafield { association :shopify_metafield }

    # Traits
    trait :with_high_spending do
      total_spent { FFaker::Random.rand(10000..50000).to_s }
    end

    trait :with_low_spending do
      total_spent { FFaker::Random.rand(100..1000).to_s }
    end

    trait :with_orders do
      orders_count { FFaker::Random.rand(1..10) }
    end

    trait :without_orders do
      orders_count { 0 }
    end
  end
end