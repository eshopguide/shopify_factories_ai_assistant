# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_inventory_item, class: 'ShopifyAPI::InventoryItem' do
    cost { FFaker::Number.decimal }
    country_code_of_origin { FFaker::Address.country_code }
    country_harmonized_system_codes { [{ code: FFaker::Lorem.characters(10) }] }
    created_at { FFaker::Time.datetime }
    harmonized_system_code { FFaker::Random.rand(1..1000) }
    id { FFaker::Random.rand(1..1000) }
    province_code_of_origin { FFaker::AddressUS.state_abbr }
    requires_shipping { FFaker::Boolean.random }
    sku { FFaker::Lorem.characters(10) }
    tracked { FFaker::Boolean.random }
    updated_at { FFaker::Time.datetime }

    trait :with_high_cost do
      cost { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_cost do
      cost { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :requires_shipping do
      requires_shipping { true }
    end

    trait :does_not_require_shipping do
      requires_shipping { false }
    end

    trait :tracked do
      tracked { true }
    end

    trait :not_tracked do
      tracked { false }
    end
  end
end