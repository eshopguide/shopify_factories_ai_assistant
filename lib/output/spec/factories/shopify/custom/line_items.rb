# frozen_string_literal: true

FactoryBot.define do
  factory :line_item, class: Hash do
    id { Faker::Number.unique.number }
    variant_id { Faker::Number.unique.number }
    product_id { Faker::Number.unique.number }
    price { Faker::Commerce.price }
    title { Faker::Commerce.product_name }
    name { Faker::Commerce.product_name }
    quantity { Faker::Number.between(from: 1, to: 10) }
    requires_shipping { true }
    tax_lines { FactoryBot.build_list(:tax_line, 1) }

    trait :with_discount_allocations do
      discount_allocations { [{ amount: 0.01 }] }
    end

    initialize_with { attributes.stringify_keys }
  end
end
