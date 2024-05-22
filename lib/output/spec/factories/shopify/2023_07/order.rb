# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_order, class: 'ShopifyAPI::Order' do
    line_items { [{ item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) }] }
    app_id { FFaker::Random.rand(1..1000) }
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    browser_ip { FFaker::Internet.ip_v4_address }
    buyer_accepts_marketing { FFaker::Boolean.random }
    cancel_reason { %w[customer fraud inventory other].sample }
    cancelled_at { FFaker::Time.datetime }
    cart_token { FFaker::Lorem.characters(10) }
    checkout_token { FFaker::Lorem.characters(10) }
    client_details { { browser: FFaker::Internet.browser, os: FFaker::Internet.user_agent } }
    closed_at { FFaker::Time.datetime }
    company { { name: FFaker::Company.name, address: FFaker::Address.street_address } }
    confirmation_number { FFaker::Lorem.characters(10) }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    current_subtotal_price { FFaker::Number.decimal }
    current_subtotal_price_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    current_total_additional_fees_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    current_total_discounts { FFaker::Number.decimal }
    current_total_discounts_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    current_total_duties_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    current_total_price { FFaker::Number.decimal }
    current_total_price_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    current_total_tax { FFaker::Number.decimal }
    current_total_tax_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    customer_locale { FFaker::Locale.code }
    discount_applications { [{ code: FFaker::Lorem.word, value: FFaker::Number.decimal }] }
    email { FFaker::Internet.email }
    estimated_taxes { FFaker::Boolean.random }
    financial_status { %w[pending authorized partially_paid paid partially_refunded refunded voided].sample }
    fulfillment_status { %w[fulfilled null partial restocked unfulfilled].sample }
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
    original_total_additional_fees_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    original_total_duties_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    payment_gateway_names { [FFaker::Payment.card_type, FFaker::Payment.card_type] }
    payment_terms { { due_in_days: FFaker::Random.rand(1..30), type: %w[net due_on_receipt].sample } }
    phone { FFaker::PhoneNumber.phone_number }
    po_number { FFaker::Lorem.characters(10) }
    presentment_currency { FFaker::Currency.code }
    processed_at { FFaker::Time.datetime }
    referring_site { FFaker::Internet.http_url }
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    shipping_lines { [{ title: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    source_identifier { FFaker::Lorem.word }
    source_name { FFaker::Lorem.word }
    source_url { FFaker::Internet.http_url }
    subtotal_price { FFaker::Number.decimal }
    subtotal_price_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    tags { FFaker::Lorem.words.join(', ') }
    tax_lines { [{ title: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    taxes_included { FFaker::Boolean.random }
    test { FFaker::Boolean.random }
    token { FFaker::Lorem.characters(10) }
    total_discounts { FFaker::Number.decimal }
    total_discounts_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    total_line_items_price { FFaker::Number.decimal }
    total_line_items_price_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    total_outstanding { FFaker::Number.decimal }
    total_price { FFaker::Number.decimal }
    total_price_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    total_shipping_price_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    total_tax { FFaker::Number.decimal }
    total_tax_set { { shop_money: { amount: FFaker::Number.decimal, currency_code: FFaker::Currency.code } } }
    total_tip_received { FFaker::Number.decimal }
    total_weight { FFaker::Random.rand(1..1000) }
    updated_at { FFaker::Time.datetime }
    user_id { FFaker::Random.rand(1..1000) }

    association :customer, factory: :shopify_customer
    association :discount_codes, factory: :shopify_discount_code
    association :fulfillments, factory: :shopify_fulfillment
    association :refunds, factory: :shopify_refund

    trait :with_multiple_line_items do
      line_items { Array.new(3) { { item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) } } }
    end

    trait :with_high_total_price do
      total_price { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_total_price do
      total_price { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :fulfilled do
      fulfillment_status { 'fulfilled' }
    end

    trait :unfulfilled do
      fulfillment_status { 'unfulfilled' }
    end

    trait :paid do
      financial_status { 'paid' }
    end

    trait :pending do
      financial_status { 'pending' }
    end
  end
end