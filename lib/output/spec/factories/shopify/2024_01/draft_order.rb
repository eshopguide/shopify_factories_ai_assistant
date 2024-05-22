#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_draft_order, class: 'ShopifyAPI::DraftOrder' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Lorem.sentence }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    completed_at { FFaker::Time.date }
    currency { FFaker::Currency.code }
    email { FFaker::Internet.email }
    invoice_sent_at { FFaker::Time.date }
    invoice_url { FFaker::Internet.http_url }
    note { FFaker::Lorem.sentence }
    status { ['open', 'invoice_sent', 'completed'].sample }
    subtotal_price { FFaker::Random.rand(100..1000).to_s }
    total_price { FFaker::Random.rand(100..1000).to_s }
    total_tax { FFaker::Random.rand(10..100).to_s }
    taxes_included { FFaker::Boolean.random }
    tax_exempt { FFaker::Boolean.random }

    # Hash attributes
    billing_address { { first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    shipping_address { { first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    applied_discount { { title: 'Discount', description: 'Seasonal discount', value: '10%', amount: FFaker::Random.rand(10..100).to_s } }
    shipping_line { { title: 'Standard Shipping', price: FFaker::Random.rand(5..20).to_s } }
    payment_terms { { due_in_days: 30, payment_terms_type: 'NET' } }

    # Array attributes
    line_items { [{ title: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10), price: FFaker::Random.rand(10..100).to_s }] }
    tax_lines { [{ title: 'GST', price: FFaker::Random.rand(1..10).to_s, rate: 0.1 }] }
    note_attributes { [{ name: 'packing', value: 'Fragile' }] }

    # Associations
    customer { association :shopify_customer }

    # Traits
    trait :completed do
      status { 'completed' }
    end

    trait :open do
      status { 'open' }
    end

    trait :with_high_value_items do
      line_items { [{ title: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..2), price: FFaker::Random.rand(100..500).to_s }] }
    end
  end
end