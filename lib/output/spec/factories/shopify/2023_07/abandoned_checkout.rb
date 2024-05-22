# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_abandoned_checkout, class: 'ShopifyAPI::AbandonedCheckout' do
    abandoned_checkout_url { FFaker::Internet.http_url }
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    buyer_accepts_marketing { FFaker::Boolean.random }
    buyer_accepts_sms_marketing { FFaker::Boolean.random }
    cart_token { FFaker::Lorem.characters(10) }
    closed_at { FFaker::Time.datetime }
    completed_at { FFaker::Time.datetime }
    created_at { FFaker::Time.datetime }
    customer_locale { FFaker::Locale.code }
    device_id { FFaker::Random.rand(1..1000) }
    discount_codes { [FFaker::Lorem.word, FFaker::Lorem.word] }
    email { FFaker::Internet.email }
    gateway { FFaker::Payment.card_type }
    landing_site { FFaker::Internet.http_url }
    line_items { { item1: FFaker::Product.product_name, item2: FFaker::Product.product_name } }
    location_id { FFaker::Random.rand(1..1000) }
    note { FFaker::Lorem.sentence }
    phone { FFaker::PhoneNumber.phone_number }
    presentment_currency { FFaker::Currency.code }
    referring_site { FFaker::Internet.http_url }
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    shipping_lines { { line1: FFaker::Lorem.word, line2: FFaker::Lorem.word } }
    sms_marketing_phone { FFaker::PhoneNumber.phone_number }
    source_name { FFaker::Lorem.word }
    subtotal_price { FFaker::Number.decimal }
    tax_lines { { tax1: FFaker::Number.decimal, tax2: FFaker::Number.decimal } }
    taxes_included { FFaker::Boolean.random }
    token { FFaker::Lorem.characters(10) }
    total_discounts { FFaker::Number.decimal }
    total_duties { FFaker::Number.decimal }
    total_line_items_price { FFaker::Number.decimal }
    total_price { FFaker::Number.decimal }
    total_tax { FFaker::Number.decimal }
    total_weight { FFaker::Random.rand(1..1000) }
    updated_at { FFaker::Time.datetime }
    user_id { FFaker::Random.rand(1..1000) }

    association :currency, factory: :shopify_currency
    association :customer, factory: :shopify_customer

    trait :with_discount_codes do
      discount_codes { [create(:shopify_discount_code), create(:shopify_discount_code)] }
    end

    trait :with_line_items do
      line_items { { item1: create(:shopify_line_item), item2: create(:shopify_line_item) } }
    end
  end
end