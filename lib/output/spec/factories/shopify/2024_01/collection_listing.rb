#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_collection_listing, class: 'ShopifyAPI::CollectionListing' do
    # Basic attributes
    collection_id { FFaker::Random.rand(1..1000) }
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    handle { FFaker::Internet.slug }
    published_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    sort_order { ['best-selling', 'alpha-asc', 'alpha-desc', 'price-asc', 'price-desc'].sample }

    # Associations
    image { association :shopify_image }

    # Array attributes for default product image
    default_product_image { [{ src: FFaker::Image.url, width: 300, height: 300, alt: FFaker::Lorem.word }] }

    # Traits
    trait :published do
      published_at { FFaker::Time.date }
    end

    trait :unpublished do
      published_at { nil }
    end
  end
end