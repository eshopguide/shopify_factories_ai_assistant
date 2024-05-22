#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_shipping_zone, class: 'ShopifyAPI::ShippingZone' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { "North America Zone" }
    profile_id { FFaker::Lorem.characters(10) }
    location_group_id { FFaker::Lorem.characters(10) }

    # Array attributes
    countries { build_list(:shopify_country, 3) }
    provinces { build_list(:shopify_province, 5) }
    price_based_shipping_rates { [{ name: "Standard Shipping", price: "10.00", conditions: "none" }] }
    weight_based_shipping_rates { [{ name: "Heavy Goods Shipping", weight_low: 0, weight_high: 100, price: "25.00" }] }
    carrier_shipping_rate_providers { [{ name: "UPS", service_filter: "all", carrier_service_id: FFaker::Random.rand(1..1000), flat_modifier: "0.00", percent_modifier: "0" }] }

    # Traits
    trait :with_global_coverage do
      countries { build_list(:shopify_country, 10) }
    end

    trait :with_specific_countries do
      countries { build_list(:shopify_country, 2, name: "United States") }
    end
  end
end