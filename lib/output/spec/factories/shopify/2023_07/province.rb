# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_province, class: 'ShopifyAPI::Province' do
    code { FFaker::AddressUS.state_abbr }
    country_id { FFaker::Random.rand(1..1000) }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::AddressUS.state }
    shipping_zone_id { FFaker::Random.rand(1..1000) }
    tax { FFaker::Number.decimal }
    tax_name { FFaker::Lorem.word }
    tax_percentage { FFaker::Number.decimal }
    tax_type { %w[vat gst pst hst].sample }

    trait :with_high_tax do
      tax { FFaker::Number.decimal(l_digits: 2) }
    end

    trait :with_low_tax do
      tax { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :with_high_tax_percentage do
      tax_percentage { FFaker::Number.decimal(l_digits: 2) }
    end

    trait :with_low_tax_percentage do
      tax_percentage { FFaker::Number.decimal(l_digits: 1) }
    end
  end
end