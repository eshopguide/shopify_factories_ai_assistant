```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_checkout, class: 'ShopifyAPI::Checkout' do
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    line_items { build_list(:shopify_line_item, 3) }
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
    source_identifier { FFaker::Lorem.word }
    source_name { FFaker::Company.name }
    source_url { FFaker::Internet.http_url }
    subtotal_price { FFaker::Number.decimal }
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
      gift_cards { build_list(:shopify_gift_card, 2) }
    end

    trait :with_shipping_line do
      shipping_line { { title: FFaker::Lorem.word, price: FFaker::Number.decimal } }
    end

    trait :with_shipping_rate do
      shipping_rate { { title: FFaker::Lorem.word, price: FFaker::Number.decimal } }
    end

    trait :with_tax_lines do
      tax_lines { [{ title: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    end
  end
end
```