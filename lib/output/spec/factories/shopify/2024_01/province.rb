#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_province, class: 'ShopifyAPI::Province' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    country_id { FFaker::Random.rand(1..1000) }
    name { FFaker::Address.state }
    code { FFaker::Address.state_abbr }
    tax { FFaker::Random.rand(0.0..15.0).round(2) }
    tax_name { 'GST' }
    tax_percentage { FFaker::Random.rand(5.0..15.0).round(2) }
    tax_type { 'percentage' }

    # Traits
    trait :with_high_tax do
      tax_percentage { 15.0 }
    end

    trait :with_low_tax do
      tax_percentage { 5.0 }
    end
  end
end