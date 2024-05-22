#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_refund, class: 'ShopifyAPI::Refund' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.date }
    processed_at { FFaker::Time.date }
    note { FFaker::Lorem.sentence }
    restock { FFaker::Boolean.random }

    # Array attributes for refund line items and transactions
    refund_line_items { build_list(:shopify_refund_line_item, 3) }
    transactions { build_list(:shopify_transaction, 2) }

    # Traits
    trait :with_full_refund do
      refund_line_items { build_list(:shopify_refund_line_item, 3, quantity: 1, restock_type: 'return', total_discounted_price_set: { shop_money: { amount: "10.00", currency_code: "USD" }, presentment_money: { amount: "10.00", currency_code: "USD" } }) }
    end

    trait :with_partial_refund do
      refund_line_items { build_list(:shopify_refund_line_item, 1, quantity: 1, restock_type: 'no_restock', total_discounted_price_set: { shop_money: { amount: "5.00", currency_code: "USD" }, presentment_money: { amount: "5.00", currency_code: "USD" } }) }
    end

    trait :restocked do
      restock { true }
    end

    trait :not_restocked do
      restock { false }
    end
  end
end