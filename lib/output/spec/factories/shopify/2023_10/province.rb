```ruby
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
    tax_type { %w[state federal].sample }

    trait :state_tax do
      tax_type { 'state' }
    end

    trait :federal_tax do
      tax_type { 'federal' }
    end

    trait :with_high_tax do
      tax_percentage { FFaker::Random.rand(10.0..20.0) }
    end

    trait :with_low_tax do
      tax_percentage { FFaker::Random.rand(1.0..9.9) }
    end
  end
end
```