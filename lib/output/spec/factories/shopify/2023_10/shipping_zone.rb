```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_shipping_zone, class: 'ShopifyAPI::ShippingZone' do
    id { FFaker::Random.rand(1..1000) }
    location_group_id { FFaker::Lorem.characters(10) }
    name { FFaker::Lorem.word }
    profile_id { FFaker::Lorem.characters(10) }
    carrier_shipping_rate_providers { [{ provider: FFaker::Company.name, service: FFaker::Lorem.word }] }
    price_based_shipping_rates { [{ name: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    weight_based_shipping_rates { [{ name: FFaker::Lorem.word, weight: FFaker::Number.decimal }] }

    countries { build_list(:shopify_country, 2) }
    provinces { build_list(:shopify_province, 2) }

    trait :with_carrier_shipping_rate_providers do
      carrier_shipping_rate_providers { [{ provider: FFaker::Company.name, service: FFaker::Lorem.word }] }
    end

    trait :with_price_based_shipping_rates do
      price_based_shipping_rates { [{ name: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    end

    trait :with_weight_based_shipping_rates do
      weight_based_shipping_rates { [{ name: FFaker::Lorem.word, weight: FFaker::Number.decimal }] }
    end
  end
end
```