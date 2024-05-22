# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_collection_listing, class: 'ShopifyAPI::CollectionListing' do
    body_html { FFaker::Lorem.paragraph }
    collection_id { FFaker::Random.rand(1..1000) }
    default_product_image { [{ src: FFaker::Image.url, alt: FFaker::Lorem.word }] }
    handle { FFaker::Internet.slug }
    published_at { FFaker::Time.datetime }
    sort_order { %w[manual best-selling title-ascending title-descending price-ascending price-descending created-ascending created-descending].sample }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }

    association :image, factory: :shopify_image

    trait :published do
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published_at { nil }
    end

    trait :with_multiple_product_images do
      default_product_image { Array.new(3) { { src: FFaker::Image.url, alt: FFaker::Lorem.word } } }
    end
  end
end