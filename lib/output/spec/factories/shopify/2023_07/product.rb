# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_product, class: 'ShopifyAPI::Product' do
    title { FFaker::Product.product_name }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    handle { FFaker::Internet.slug }
    id { FFaker::Random.rand(1..1000) }
    images { [{ src: FFaker::Image.url, alt: FFaker::Lorem.word }] }
    options { [{ name: FFaker::Lorem.word, values: [FFaker::Lorem.word, FFaker::Lorem.word] }] }
    product_type { FFaker::Product.product }
    published_at { FFaker::Time.datetime }
    published_scope { %w[web global].sample }
    status { %w[active archived draft].sample }
    tags { FFaker::Lorem.words.join(', ') }
    template_suffix { FFaker::Lorem.word }
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

    trait :active do
      status { 'active' }
    end

    trait :archived do
      status { 'archived' }
    end

    trait :draft do
      status { 'draft' }
    end
  end
end