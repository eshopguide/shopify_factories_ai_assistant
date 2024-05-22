# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_draft_order, class: 'ShopifyAPI::DraftOrder' do
    applied_discount { { code: FFaker::Lorem.word, amount: FFaker::Number.decimal } }
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    completed_at { FFaker::Time.datetime }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    email { FFaker::Internet.email }
    id { FFaker::Random.rand(1..1000) }
    invoice_sent_at { FFaker::Time.datetime }
    invoice_url { FFaker::Internet.http_url }
    line_items { [{ item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) }] }
    name { FFaker::Lorem.word }
    note { FFaker::Lorem.sentence }
    note_attributes { [{ name: FFaker::Lorem.word, value: FFaker::Lorem.word }] }
    order_id { FFaker::Random.rand(1..1000) }
    payment_terms { { due_in_days: FFaker::Random.rand(1..30), type: %w[net due_on_receipt].sample } }
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    shipping_line { { title: FFaker::Lorem.word, price: FFaker::Number.decimal } }
    source_name { FFaker::Lorem.word }
    status { %w[open invoice_sent completed].sample }
    subtotal_price { FFaker::Number.decimal }
    tags { FFaker::Lorem.words.join(', ') }
    tax_exempt { FFaker::Boolean.random }
    tax_exemptions { [FFaker::Lorem.word, FFaker::Lorem.word] }
    tax_lines { [{ title: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    taxes_included { FFaker::Boolean.random }
    total_price { FFaker::Number.decimal }
    total_tax { FFaker::Number.decimal }
    updated_at { FFaker::Time.datetime }

    association :customer, factory: :shopify_customer

    trait :with_multiple_line_items do
      line_items { Array.new(3) { { item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) } } }
    end

    trait :with_high_total_price do
      total_price { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_total_price do
      total_price { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :tax_exempt do
      tax_exempt { true }
    end

    trait :not_tax_exempt do
      tax_exempt { false }
    end
  end
end