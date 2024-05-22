```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_order, class: 'ShopifyAPI::Order' do
    line_items { build_list(:shopify_line_item, 3) }
    app_id { FFaker::Random.rand(1..1000) }
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    browser_ip { FFaker::Internet.ip_v4_address }
    buyer_accepts_marketing { FFaker::Boolean.random }
    cancel_reason { %w[customer changed_mind fraud].sample }
    cancelled_at { FFaker::Time.datetime }
    cart_token { FFaker::Lorem.characters(10) }
    checkout_token { FFaker::Lorem.characters(10) }
    client_details { { browser_ip: FFaker::Internet.ip_v4_address, user_agent: FFaker::Internet.user_agent } }
    closed_at { FFaker::Time.datetime }
    company { { name: FFaker::Company.name } }
    confirmation_number { FFaker::Lorem.characters(10) }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    current_subtotal_price { FFaker::Number.decimal }
    current_total_discounts { FFaker::Number.decimal }
    current_total_price { FFaker::Number.decimal }
    current_total_tax { FFaker::Number.decimal }
    customer_locale { FFaker::Locale.code }
    discount_applications { [{ code: FFaker::Lorem.word, value: FFaker::Number.decimal }] }
    email { FFaker::Internet.email }
    estimated_taxes { FFaker::Boolean.random }
    financial_status { %w[pending paid refunded].sample }
    fulfillment_status { %w[fulfilled unfulfilled].sample }
    gateway { FFaker::Payment.card_type }
    id { FFaker::Random.rand(1..1000) }
    landing_site { FFaker::Internet.http_url }
    location_id { FFaker::Random.rand(1..1000) }
    merchant_of_record_app_id { FFaker::Random.rand(1..1000) }
    name { FFaker::Lorem.word }
    note { FFaker::Lorem.sentence }
    note_attributes { [{ name: FFaker::Lorem.word, value: FFaker::Lorem.word }] }
    number { FFaker::Random.rand(1..1000) }
    order_number { FFaker::Random.rand(1..1000) }
    order_status_url { FFaker::Internet.http_url }
    payment_gateway_names { [FFaker::Payment.card_type] }
    phone { FFaker::PhoneNumber.phone_number }
    po_number { FFaker::Lorem.characters(10) }
    presentment_currency { FFaker::Currency.code }
    processed_at { FFaker::Time.datetime }
    referring_site { FFaker::Internet.http_url }
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    source_identifier { FFaker::Lorem.word }
    source_name { FFaker::Company.name }
    source_url { FFaker::Internet.http_url }
    subtotal_price { FFaker::Number.decimal }
    tags { FFaker::Lorem.words.join(', ') }
    taxes_included { FFaker::Boolean.random }
    test { FFaker::Boolean.random }
    token { FFaker::Lorem.characters(10) }
    total_discounts { FFaker::Number.decimal }
    total_line_items_price { FFaker::Number.decimal }
    total_outstanding { FFaker::Number.decimal }
    total_price { FFaker::Number.decimal }
    total_tax { FFaker::Number.decimal }
    total_tip_received { FFaker::Number.decimal }
    total_weight { FFaker::Random.rand(1..1000) }
    updated_at { FFaker::Time.datetime }
    user_id { FFaker::Random.rand(1..1000) }

    association :customer, factory: :shopify_customer
    discount_codes { build_list(:shopify_discount_code, 2) }
    fulfillments { build_list(:shopify_fulfillment, 2) }
    refunds { build_list(:shopify_refund, 2) }

    trait :pending do
      financial_status { 'pending' }
    end

    trait :paid do
      financial_status { 'paid' }
    end

    trait :refunded do
      financial_status { 'refunded' }
    end

    trait :fulfilled do
      fulfillment_status { 'fulfilled' }
    end

    trait :unfulfilled do
      fulfillment_status { 'unfulfilled' }
    end

    trait :with_note do
      note { FFaker::Lorem.sentence }
    end

    trait :with_tags do
      tags { FFaker::Lorem.words.join(', ') }
    end
  end
end
```