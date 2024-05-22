```ruby
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

    transactions { build_list(:shopify_transaction, 2) }

    trait :with_note do
      note { FFaker::Lorem.sentence }
    end

    trait :with_duties do
      duties { [{ duty_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal }] }
    end

    trait :with_order_adjustments do
      order_adjustments { [{ adjustment_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal }] }
    end

    trait :with_refund_duties do
      refund_duties { [{ duty_id: FFaker::Random.rand(1..1000), amount: FFaker::Number.decimal }] }
    end

    trait :with_refund_line_items do
      refund_line_items { [{ line_item_id: FFaker::Random.rand(1..1000), quantity: FFaker::Random.rand(1..10) }] }
    end
  end
end
```