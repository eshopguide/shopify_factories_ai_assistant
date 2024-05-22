#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_storefront_access_token, class: 'ShopifyAPI::StorefrontAccessToken' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    title { "Mobile App Access" }
    access_scope { "unauthenticated_read_product_listings" }
    access_token { FFaker::Internet.password(min_length: 40, max_length: 40) }
    created_at { FFaker::Time.date }

    # Traits
    trait :with_custom_scope do
      access_scope { "unauthenticated_write_checkouts" }
    end

    trait :with_default_scope do
      access_scope { "unauthenticated_read_product_listings" }
    end
  end
end