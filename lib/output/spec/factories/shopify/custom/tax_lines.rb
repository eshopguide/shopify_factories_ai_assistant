# frozen_string_literal: true

FactoryBot.define do
  factory :tax_line, class: Hash do
    title { Faker::Commerce.department }
    price { Faker::Commerce.price }
    rate { Faker::Number.decimal(l_digits: 2) }

    initialize_with { attributes.stringify_keys }
  end
end
