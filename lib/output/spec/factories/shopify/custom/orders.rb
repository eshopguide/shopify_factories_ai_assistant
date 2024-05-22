# frozen_string_literal: true

FactoryBot.define do
  factory :order, class: ShopifyAPI::Order do
    transient do
      address { FactoryBot.build(:address) }
      order_email { Faker::Internet.email }
      order_id { Faker::Number.unique.number }
    end

    id { order_id }
    email { order_email }
    name { Faker::Commerce.product_name }
    processed_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).to_s }
    customer { nil }
    billing_address { nil }
    shipping_address { nil }
    source_name { '' }
    financial_status { '' }
    note_attributes { [] }
    taxes_included { true }
    total_discounts { '0.0' }
    payment_gateway_names { [] }

    trait :pos_order do
      source_name { 'pos' }
    end

    trait :with_mixed_line_item_taxes_and_no_shipping_line_tax do
      line_items do
        [
          FactoryBot.build(:line_item, tax_lines: [
                             FactoryBot.build(:tax_line, rate: 0.07)
                           ]),
          FactoryBot.build(:line_item, tax_lines: [
                             FactoryBot.build(:tax_line, rate: 0.19)
                           ])
        ]
      end
      shipping_lines do
        [
          FactoryBot.build(:shipping_line, tax_lines: [])
        ]
      end
    end

    trait :with_zero_tax_rate do
      line_items do
        [
          FactoryBot.build(:line_item, tax_lines: [
                             FactoryBot.build(:tax_line, rate: 0.0)
                           ])
        ]
      end
    end

    trait :with_positive_tax_rate do
      line_items do
        [
          FactoryBot.build(:line_item, tax_lines: [
                             FactoryBot.build(:tax_line, rate: 0.19)
                           ])
        ]
      end
    end

    trait :with_tax_lines do
      transient do
        tax_lines_count { 1 }
      end

      tax_lines { FactoryBot.build_list(:tax_line, tax_lines_count) }
    end

    trait :with_line_items do
      transient do
        line_items_count { 1 }
      end

      line_items { FactoryBot.build_list(:line_item, line_items_count) }
    end

    trait :with_discounted_line_items do
      line_items { FactoryBot.build_list(:line_item, 1, :with_discount_allocations) }
    end

    trait :with_shipping_lines do
      transient do
        shipping_lines_count { 1 }
      end

      shipping_lines { FactoryBot.build_list(:shipping_line, shipping_lines_count) }
    end

    trait :with_billing_address do
      billing_address { address }
    end

    trait :with_shipping_address do
      shipping_address { address }
    end

    trait :with_customer do
      customer { FactoryBot.build(:shopify_customer, default_address: address, email: order_email) }
    end

    trait :with_company_customer do
      shipping_address { FactoryBot.build(:address, :with_company) }
    end

    trait :with_EEA_country_address do
      shipping_address { FactoryBot.build(:address, :EEA_Country) }
    end

    trait :with_switzerland_address do
      shipping_address { FactoryBot.build(:address, :Switzerland) }
    end

    trait :with_USA_address do
      shipping_address { FactoryBot.build(:address, :USA) }
    end

    trait :with_refund do
      transient do
        refunds_count { 1 }
      end

      refunds { FactoryBot.build_list(:refund, refunds_count, address:, email: order_email, order_id_param: order_id) }
    end

    trait :with_fulfillments do
      fulfillments do
        [
          FactoryBot.build(:fulfillment)
        ]
      end
    end
  end

  factory :shipping_line, class: Hash do
    id { Faker::Number.unique.number }
    title { Faker::Number.between(from: 1, to: 10) }
    price { Faker::Number.unique.number }
    tax_lines { FactoryBot.build_list(:tax_line, 1) }
    initialize_with do
      attributes.stringify_keys
    end
  end

  factory :fulfillment, class: ShopifyAPI::Fulfillment do
    sequence(:id) { |n| n }
    sequence(:order_id) { |n| n }
    sequence(:location_id) { |n| n }
    name { Faker::Commerce.product_name }
    tracking_number { Faker::Number.unique.number(digits: 10) }
    tracking_company { Faker::Company.name }
    tracking_url { Faker::Internet.url }
    status { %w[pending success cancelled error failure].sample }
    shipment_status { %w[confirmed in_transit out_for_delivery delivered failure].sample }
    service { Faker::Company.industry }
    variant_inventory_management { Faker::Commerce.department }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).to_s }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).to_s }

    line_items { [{}] }
    origin_address { [{}] }
    tracking_numbers { [Faker::Number.unique.number(digits: 10)] }
    tracking_urls { [Faker::Internet.url] }
    receipt { {} }

    notify_customer { false }
  end
end
