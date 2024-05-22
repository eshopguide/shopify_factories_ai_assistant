#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_checkout, class: 'ShopifyAPI::Checkout' do
    # Basic attributes
    token { FFaker::Internet.password }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    currency { FFaker::Currency.code }
    subtotal_price { FFaker::Random.rand(100..1000).to_s }
    total_price { FFaker::Random.rand(100..1000).to_s }
    total_tax { FFaker::Random.rand(10..100).to_s }
    payment_due { FFaker::Random.rand(100..1000).to_s }
    payment_url { FFaker::Internet.http_url }
    web_url { FFaker::Internet.http_url }
    email { FFaker::Internet.email }
    phone { FFaker::PhoneNumber.phone_number }
    customer_id { FFaker::Random.rand(1..1000) }
    user_id { FFaker::Random.rand(1..1000) }
    source_name { 'web' }
    source_url { FFaker::Internet.http_url }
    source_identifier { FFaker::Lorem.word }
    presentment_currency { FFaker::Currency.code }
    reservation_time { FFaker::Time.date }
    reservation_time_left { FFaker::Random.rand(1..100) }

    # Boolean attributes
    buyer_accepts_marketing { FFaker::Boolean.random }
    requires_shipping { FFaker::Boolean.random }
    taxes_included { FFaker::Boolean.random }

    # Hash attributes
    billing_address { { first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    shipping_address { { first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    shipping_line { { code: FFaker::Lorem.word, price: FFaker::Random.rand(10..100).to_s, title: FFaker::Lorem.sentence } }
    shipping_rate { { code: FFaker::Lorem.word, price: FFaker::Random.rand(10..100).to_s } }
    applied_discount { { code: FFaker::Lorem.word, amount: FFaker::Random.rand(10..100).to_s, type: 'fixed_amount' } }

    # Array attributes
    line_items { [{ product_id: FFaker::Random.rand(1..1000), variant_id: FFaker::Random.rand(1..1000), quantity: FFaker::Random.rand(1..10) }] }
    gift_cards { [{ code: FFaker::Lorem.word, amount: FFaker::Random.rand(10..100).to_s }] }
    tax_lines { [{ title: 'GST', price: FFaker::Random.rand(1..10).to_s, rate: 0.1 }] }

    # Associations
    discount_code { association :shopify_discount_code }
    order { association :shopify_order }

    # Traits
    trait :with_marketing do
      buyer_accepts_marketing { true }
    end

    trait :without_marketing do
      buyer_accepts_marketing { false }
    end

    trait :requires_shipping do
      requires_shipping { true }
    end

    trait :no_shipping_required do
      requires_shipping { false }
    end
  end
end