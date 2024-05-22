```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_storefront_access_token, class: 'ShopifyAPI::StorefrontAccessToken' do
    title { FFaker::Lorem.sentence }
    access_scope { 'unauthenticated_read_product_listings' }
    access_token { FFaker::Lorem.characters(32) }
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }

    trait :with_custom_scope do
      access_scope { 'unauthenticated_read_content' }
    end

    trait :with_custom_token do
      access_token { FFaker::Lorem.characters(64) }
    end
  end
end
```