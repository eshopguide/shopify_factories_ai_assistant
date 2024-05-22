# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_refund, class: 'ShopifyAPI::Refund' do
    created_at { FFaker::Time.datetime }
    duties { [{ duty_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal }] }
    id { FFaker::Random.rand(1..1000) }
    note { FFaker::Lorem.sentence }
    order_adjustments { [{ adjustment_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal }] }
    order_id { FFaker::Random.rand(1..1000) }
    processed_at { FFaker::Time.datetime }
    refund_duties { [{ duty_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal }] }
    refund_line_items { [{ line_item_id: FFaker::Random.rand(1..1000), quantity: FFaker::Random.rand(1..10) }] }
    restock { FFaker::Boolean.random }
    user_id { FFaker::Random.rand(1..1000) }

    association :transactions, factory: :shopify_transaction

    trait :with_multiple_duties do
      duties { Array.new(3) { { duty_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal } } }
    end

    trait :with_multiple_order_adjustments do
      order_adjustments { Array.new(3) { { adjustment_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal } } }
    end

    trait :with_multiple_refund_duties do
      refund_duties { Array.new(3) { { duty_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal } } }
    end

    trait :with_multiple_refund_line_items do
      refund_line_items { Array.new(3) { { line_item_id: FFaker::Random.rand(1..1000), quantity: FFaker::Random.rand(1..10) } } }
    end

    trait :restocked do
      restock { true }
    end

    trait :not_restocked do
      restock { false }
    end
  end
end