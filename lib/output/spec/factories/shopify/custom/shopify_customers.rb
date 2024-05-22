# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_customer, class: ShopifyAPI::Customer do
    id { Faker::Number.unique.number }
    email { Faker::Internet.email }
    tax_exempt { false }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).to_s }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).to_s }
    note { '' }
    phone { Faker::PhoneNumber.phone_number }
    default_address { build(:address) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    last_order_id { Faker::Number.unique.number }
  end
end
