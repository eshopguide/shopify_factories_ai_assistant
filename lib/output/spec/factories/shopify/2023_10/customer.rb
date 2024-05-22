```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_customer, class: 'ShopifyAPI::Customer' do
    accepts_marketing { FFaker::Boolean.random }
    accepts_marketing_updated_at { FFaker::Time.datetime }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    email { FFaker::Internet.email }
    first_name { FFaker::Name.first_name }
    id { FFaker::Random.rand(1..1000) }
    last_name { FFaker::Name.last_name }
    orders_count { FFaker::Random.rand(1..100) }
    phone { FFaker::PhoneNumber.phone_number }
    state { %w[enabled disabled].sample }
    tags { FFaker::Lorem.words.join(', ') }
    total_spent { FFaker::Number.decimal }
    updated_at { FFaker::Time.datetime }
    verified_email { FFaker::Boolean.random }

    trait :with_addresses do
      addresses { build_list(:shopify_address, 2) }
    end

    trait :with_default_address do
      default_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    end

    trait :with_metafield do
      association :metafield, factory: :shopify_metafield
    end

    trait :with_email_marketing_consent do
      email_marketing_consent { { state: %w[granted denied].sample, opt_in_level: %w[confirmed single_opt_in].sample } }
    end

    trait :with_sms_marketing_consent do
      sms_marketing_consent { { state: %w[granted denied].sample, opt_in_level: %w[confirmed single_opt_in].sample } }
    end
  end
end
```