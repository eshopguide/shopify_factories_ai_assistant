#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_order, class: 'ShopifyAPI::Order' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    email { FFaker::Internet.email }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    closed_at { nil }
    currency { FFaker::Currency.code }
    total_price { FFaker::Random.rand(100.00..1000.00).round(2).to_s }
    subtotal_price { FFaker::Random.rand(50.00..500.00).round(2).to_s }
    total_tax { FFaker::Random.rand(5.00..50.00).round(2).to_s }
    financial_status { ['paid', 'pending', 'refunded', 'voided'].sample }
    fulfillment_status { ['fulfilled', 'unfulfilled', 'partial'].sample }
    total_discounts { FFaker::Random.rand(0.00..100.00).round(2).to_s }
    order_number { FFaker::Random.rand(1000..9999) }
    note { FFaker::Lorem.sentence }
    token { FFaker::Internet.password(min_length: 8, max_length: 20) }
    buyer_accepts_marketing { FFaker::Boolean.random }
    taxes_included { FFaker::Boolean.random }
    test { FFaker::Boolean.random }

    # Hash attributes
    billing_address { { first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    shipping_address { { first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }

    # Array attributes
    line_items { build_list(:shopify_line_item, 3) }
    shipping_lines { build_list(:shopify_shipping_line, 1) }
    tax_lines { build_list(:shopify_tax_line, 2) }
    discount_codes { build_list(:shopify_discount_code, 1) }

    # Associations
    customer { association :shopify_customer }

    # Traits
    trait :closed do
      closed_at { FFaker::Time.date }
    end

    trait :open do
      closed_at { nil }
    end

    trait :with_high_value_items do
      line_items { build_list(:shopify_line_item, 3, price: FFaker::Random.rand(200.00..1000.00).round(2).to_s) }
    end

    trait :with_low_value_items do
      line_items { build_list(:shopify_line_item, 3, price: FFaker::Random.rand(10.00..50.00).round(2).to_s) }
    end
  end
end