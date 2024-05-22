```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_collection_listing, class: 'ShopifyAPI::CollectionListing' do
    body_html { FFaker::Lorem.paragraph }
    collection_id { FFaker::Random.rand(1..1000) }
    handle { FFaker::Lorem.word }
    published_at { FFaker::Time.datetime }
    sort_order { %w[alpha best-selling created].sample }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }

    association :image, factory: :shopify_image

    trait :with_default_product_image do
      default_product_image { [{ src: FFaker::Avatar.image }] }
    end

    trait :published do
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published_at { nil }
    end
  end
end
```