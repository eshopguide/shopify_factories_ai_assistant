#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_inventory_item, class: 'ShopifyAPI::InventoryItem' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    sku { FFaker::Product.model }
    cost { FFaker::Random.rand(10.0..100.0).round(2).to_s }
    country_code_of_origin { FFaker::Address.country_code }
    province_code_of_origin { FFaker::Address.state_abbr }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    tracked { FFaker::Boolean.random }
    requires_shipping { FFaker::Boolean.random }

    # Array attributes
    country_harmonized_system_codes { [{ country_code: FFaker::Address.country_code, harmonized_system_code: FFaker::Random.rand(1000..9999) }] }

    # Traits
    trait :tracked do
      tracked { true }
    end

    trait :untracked do
      tracked { false }
    end

    trait :requires_shipping do
      requires_shipping { true }
    end

    trait :does_not_require_shipping do
      requires_shipping { false }
    end
  end
end