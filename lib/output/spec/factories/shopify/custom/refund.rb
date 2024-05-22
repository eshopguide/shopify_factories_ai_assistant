# frozen_string_literal: true

FactoryBot.define do
  factory :refund, class: ShopifyAPI::Refund do
    transient do
      address { build(:address) }
      email { Faker::Internet.email }
      refund_id { Faker::Number.unique.number }
      order_id_param { Faker::Number.unique.number }
      refund_line_items_count { 1 }
      transactions_count { 1 }
      order_adjustments_count { 1 }
    end

    id { refund_id }
    order_id { order_id_param }
    user_id { Faker::Number.unique.number }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).to_s }
    processed_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).to_s }
    refund_line_items { FactoryBot.build_list(:refund_line_item, refund_line_items_count) }
    transactions do
      FactoryBot.build_list(:transaction, transactions_count,
                            order_id: order_id_param, parent_id: refund_id)
    end
    order_adjustments do
      FactoryBot.build_list(:order_adjustments, order_adjustments_count,
                            order_id: order_id_param,
                            refund_id:)
    end

    trait :with_billing_address do
      billing_address { address }
    end

    trait :with_shipping_address do
      shipping_address { address }
    end

    trait :with_customer do
      customer { build(:customer, default_address: address, email:) }
    end
  end

  factory :refund_line_item, class: Hash do
    transient do
      line_item_object { FactoryBot.build(:line_item) }
    end

    initialize_with do
      {
        id: Faker::Number.unique.number,
        message: '',
        quantity: Faker::Number.between(from: 1, to: 10),
        subtotal: line_item_object[:price],
        total_tax: Faker::Commerce.price,
        line_item_id: Faker::Number.unique.number,
        line_item: line_item_object
      }.stringify_keys
    end
  end

  factory :transaction, class: ShopifyAPI::Transaction do
    sequence(:id) { |n| n }
    kind { 'refund' }
    amount { '100.00' }
    authorization { 'authorization_code' }
    authorization_expires_at { '2023-12-31T23:59:59Z' }
    created_at { '2023-01-01T00:00:00Z' }
    currency { 'EUR' }
    currency_exchange_adjustment { { adjustment: '5.00', original_amount: '105.00', final_amount: '100.00' } }
    sequence(:device_id) { |n| n }
    error_code { 'error_code_example' }
    extended_authorization_attributes { { some_attribute: 'value' } }
    gateway { 'paypal' }
    sequence(:location_id) { |n| n }
    message { 'Transaction successful' }
    sequence(:order_id) { |n| n }
    parent_id { 1 }
    payment_details { { card_brand: 'Visa', card_bin: '123456' } }
    payments_refund_attributes { { refund_id: 1, amount: '50.00' } }
    processed_at { '2023-01-01T01:00:00Z' }
    receipt { { transaction_receipt: 'receipt_code' } }
    source_name { 'web' }
    status { 'success' }
    test { false }
    total_unsettled_set { { unsettled_amount: '50.00' } }
    sequence(:user_id) { |n| n }
  end

  factory :order_adjustments, class: Hash do
    id { Faker::Number.unique.number }
    order_id { Faker::Number.unique.number }
    refund_id { Faker::Number.unique.number }
    amount { Faker::Commerce.price }
    tax_amount { Faker::Commerce.price }
    kind { 'shipping_refund' }

    initialize_with { attributes.stringify_keys }
  end
end
