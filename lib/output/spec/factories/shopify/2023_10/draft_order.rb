```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_draft_order, class: 'ShopifyAPI::DraftOrder' do
    applied_discount { { value: FFaker::Number.decimal, value_type: 'fixed_amount' } }
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    completed_at { FFaker::Time.datetime }
    created_at { FFaker::Time.datetime }
    currency { FFaker::Currency.code }
    email { FFaker::Internet.email }
    id { FFaker::Random.rand(1..1000) }
    invoice_sent_at { FFaker::Time.datetime }
    invoice_url { FFaker::Internet.http_url }
    line_items { build_list(:shopify_line_item, 3) }
    name { FFaker::Lorem.word }
    note { FFaker::Lorem.sentence }
    note_attributes { [{ name: FFaker::Lorem.word, value: FFaker::Lorem.word }] }
    order_id { FFaker::Random.rand(1..1000) }
    payment_terms { { due_in_days: FFaker::Random.rand(1..30), type: 'net' } }
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    shipping_line { { title: FFaker::Lorem.word, price: FFaker::Number.decimal } }
    source_name { FFaker::Company.name }
    status { %w[open invoice_sent completed].sample }
    subtotal_price { FFaker::Number.decimal }
    tags { FFaker::Lorem.words.join(', ') }
    tax_exempt { FFaker::Boolean.random }
    tax_exemptions { %w[exempt_all exempt_shipping exempt_taxes].sample(2) }
    tax_lines { [{ title: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    taxes_included { FFaker::Boolean.random }
    total_price { FFaker::Number.decimal }
    total_tax { FFaker::Number.decimal }
    updated_at { FFaker::Time.datetime }

    association :customer, factory: :shopify_customer

    trait :completed do
      status { 'completed' }
    end

    trait :open do
      status { 'open' }
    end

    trait :invoice_sent do
      status { 'invoice_sent' }
    end

    trait :with_shipping_line do
      shipping_line { { title: FFaker::Lorem.word, price: FFaker::Number.decimal } }
    end

    trait :with_tax_lines do
      tax_lines { [{ title: FFaker::Lorem.word, price: FFaker::Number.decimal }] }
    end
  end
end
```