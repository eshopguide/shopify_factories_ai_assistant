#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_country, class: 'ShopifyAPI::Country' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    code { FFaker::Address.country_code }
    name { FFaker::Address.country }
    tax { FFaker::Random.rand(0.0..20.0).round(2) }

    # Array attributes for provinces
    provinces { [{ name: FFaker::Address.state, code: FFaker::Address.state_abbr, tax: FFaker::Random.rand(0.0..15.0).round(2) }] }

    # Traits
    trait :with_provinces do
      provinces { Array.new(3) { { name: FFaker::Address.state, code: FFaker::Address.state_abbr, tax: FFaker::Random.rand(0.0..15.0).round(2) } } }
    end

    trait :without_provinces do
      provinces { [] }
    end
  end
end