# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_product_listing, class: 'ShopifyAPI::ProductListing' do
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    handle { FFaker::Internet.slug }
    images { [{ src: FFaker::Image.url, alt: FFaker::Lorem.word }] }
    options { [{ name: FFaker::Lorem.word, values: [FFaker::Lorem.word, FFaker::Lorem.word] }] }
    product_id { FFaker::Random.rand(1..1000) }
    product_type { FFaker::Product.product }
    published_at { FFaker::Time.datetime }
    tags { FFaker::Lorem.words.join(', ') }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }
    variants { [{ title: FFaker::Product.product_name, price: FFaker::Number.decimal }] }
    vendor { FFaker::Company.name }

    association :images, factory: :shopify_image
    association :variants, factory: :shopify_variant

    trait :published do
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published_at { nil }
    end

    trait :with_multiple_images do
      images { Array.new(3) { { src: FFaker::Image.url, alt: FFaker::Lorem.word } } }
    end

    trait :with_multiple_variants do
      variants { Array.new(3) { { title: FFaker::Product.product_name, price: FFaker::Number.decimal } } }
    end
  end
end