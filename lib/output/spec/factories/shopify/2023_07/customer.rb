# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_customer, class: 'ShopifyAPI::Customer' do
    accepts_marketing { FFaker::Boolean.random }
    accepts_marketing_updated_at { FFaker::Time.datetime }
    addresses { [{ address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country }] }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    default_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    email { FFaker::Internet.email }
    email_marketing_consent { { state: %w[granted pending].sample, opt_in_level: %w[confirmed single_opt_in].sample } }
    first_name { FFaker::Name.first_name }
    id { FFaker::Random.rand(1..1000) }
    last_name { FFaker::Name.last_name }
    last_order_id { FFaker::Random.rand(1..1000) }
    last_order_name { FFaker::Lorem.word }
    marketing_opt_in_level { %w[confirmed single_opt_in].sample }
    multipass_identifier { FFaker::Lorem.characters(10) }
    note { FFaker::Lorem.sentence }
    orders_count { FFaker::Random.rand(1..100) }
    password { FFaker::Internet.password }
    password_confirmation { password }
    phone { FFaker::PhoneNumber.phone_number }
    sms_marketing_consent { { state: %w[granted pending].sample, opt_in_level: %w[confirmed single_opt_in].sample } }
    state { %w[enabled disabled].sample }
    tags { FFaker::Lorem.words.join(', ') }
    tax_exempt { FFaker::Boolean.random }
    tax_exemptions { [FFaker::Lorem.word, FFaker::Lorem.word] }
    total_spent { FFaker::Number.decimal }
    updated_at { FFaker::Time.datetime }
    verified_email { FFaker::Boolean.random }

    association :metafield, factory: :shopify_metafield

    trait :with_multiple_addresses do
      addresses { Array.new(3) { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } } }
    end

    trait :with_high_orders_count do
      orders_count { FFaker::Random.rand(101..500) }
    end

    trait :with_low_orders_count do
      orders_count { FFaker::Random.rand(1..10) }
    end

    trait :tax_exempt do
      tax_exempt { true }
    end

    trait :not_tax_exempt do
      tax_exempt { false }
    end
  end
end