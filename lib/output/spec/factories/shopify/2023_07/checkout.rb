# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_checkout, class: 'ShopifyAPI::Checkout' do
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    line_items { [{ item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) }] }
    applied_discount { { code: FFaker::Lorem.word, amount: FFaker::Number.decimal } }
    buyer_accepts_marketing { FFaker::Boolean.random }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    customer_id { FFaker::Random.rand(1..1000) }
    email { FFaker::Internet.email }
    payment_due { FFaker::Number.decimal }
    payment_url { FFaker::Internet.http_url }
    phone { FFaker::PhoneNumber.phone_number }
    presentment_currency { FFaker::Currency.code }
    requires_shipping { FFaker::Boolean.random }
    reservation_time { FFaker::Time.datetime }
    reservation_time_left { FFaker::Random.rand(1..100) }
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    shipping_line { { title: FFaker::Lorem.word, price: FFaker::Number.decimal } }
    shipping_rate { { title: FFaker::Lorem.word, price: FFaker::Number.decimal } }
    source_identifier { FFaker::Lorem.word }
    source_name { FFaker::Lorem.word }
    source_url { FFaker::Internet.http_url }
    subtotal_price { FFaker::Number.decimal }
    tax_lines { [{ title: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    taxes_included { FFaker::Boolean.random }
    token { FFaker::Lorem.characters(10) }
    total_price { FFaker::Number.decimal }
    total_tax { FFaker::Number.decimal }
    updated_at { FFaker::Time.datetime }
    user_id { FFaker::Random.rand(1..1000) }
    web_url { FFaker::Internet.http_url }

    association :discount_code, factory: :shopify_discount_code
    association :order, factory: :shopify_order

    trait :with_gift_cards do
      gift_cards { Array.new(2) { { code: FFaker::Lorem.characters(10), balance: FFaker::Number.decimal } } }
    end

    trait :with_multiple_line_items do
      line_items { Array.new(3) { { item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) } } }
    end

    trait :with_high_total_price do
      total_price { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_total_price do
      total_price { FFaker::Number.decimal(l_digits: 1) }
    end
  end
end