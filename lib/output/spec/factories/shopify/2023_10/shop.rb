```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_shop, class: 'ShopifyAPI::Shop' do
    address1 { FFaker::Address.street_address }
    address2 { FFaker::Address.secondary_address }
    checkout_api_supported { FFaker::Boolean.random }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    country_code { FFaker::Address.country_code }
    country_name { FFaker::Address.country }
    county_taxes { FFaker::Boolean.random }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    customer_email { FFaker::Internet.email }
    domain { FFaker::Internet.domain_name }
    eligible_for_card_reader_giveaway { FFaker::Boolean.random }
    eligible_for_payments { FFaker::Boolean.random }
    email { FFaker::Internet.email }
    enabled_presentment_currencies { [FFaker::Currency.code, FFaker::Currency.code] }
    finances { FFaker::Boolean.random }
    force_ssl { FFaker::Boolean.random }
    google_apps_domain { FFaker::Internet.domain_name }
    google_apps_login_enabled { FFaker::Boolean.random }
    has_discounts { FFaker::Boolean.random }
    has_gift_cards { FFaker::Boolean.random }
    has_storefront { FFaker::Boolean.random }
    iana_timezone { FFaker::Address.time_zone }
    id { FFaker::Random.rand(1..1000) }
    latitude { FFaker::Geolocation.lat }
    longitude { FFaker::Geolocation.lng }
    marketing_sms_consent_enabled_at_checkout { FFaker::Boolean.random }
    money_format { FFaker::Lorem.word }
    money_in_emails_format { FFaker::Lorem.word }
    money_with_currency_format { FFaker::Lorem.word }
    money_with_currency_in_emails_format { FFaker::Lorem.word }
    multi_location_enabled { FFaker::Boolean.random }
    myshopify_domain { FFaker::Internet.domain_name }
    name { FFaker::Company.name }
    password_enabled { FFaker::Boolean.random }
    phone { FFaker::PhoneNumber.phone_number }
    plan_display_name { FFaker::Lorem.word }
    plan_name { FFaker::Lorem.word }
    pre_launch_enabled { FFaker::Boolean.random }
    primary_locale { FFaker::Locale.code }
    primary_location_id { FFaker::Random.rand(1..1000) }
    province { FFaker::AddressUS.state }
    province_code { FFaker::AddressUS.state_abbr }
    requires_extra_payments_agreement { FFaker::Boolean.random }
    setup_required { FFaker::Boolean.random }
    shop_owner { FFaker::Name.name }
    source { FFaker::Lorem.word }
    tax_shipping { FFaker::Lorem.word }
    taxes_included { FFaker::Boolean.random }
    timezone { FFaker::Address.time_zone }
    transactional_sms_disabled { FFaker::Boolean.random }
    updated_at { FFaker::Time.datetime }
    weight_unit { %w[kg g lb oz].sample }
    zip { FFaker::AddressUS.zip_code }

    trait :with_address2 do
      address2 { FFaker::Address.secondary_address }
    end

    trait :without_address2 do
      address2 { nil }
    end

    trait :with_google_apps do
      google_apps_domain { FFaker::Internet.domain_name }
      google_apps_login_enabled { true }
    end

    trait :without_google_apps do
      google_apps_domain { nil }
      google_apps_login_enabled { false }
    end

    trait :with_discounts do
      has_discounts { true }
    end

    trait :without_discounts do
      has_discounts { false }
    end

    trait :with_gift_cards do
      has_gift_cards { true }
    end

    trait :without_gift_cards do
      has_gift_cards { false }
    end
  end
end
```