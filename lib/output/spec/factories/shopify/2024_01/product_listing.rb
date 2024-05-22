#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_product_listing, class: 'ShopifyAPI::ProductListing' do
    # Basic attributes
    product_id { FFaker::Random.rand(1..1000) }
    title { FFaker::Product.product_name }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    published_at { FFaker::Time.date }
    handle { FFaker::Internet.slug }
    product_type { ['Clothing', 'Accessories', 'Footwear'].sample }
    vendor { FFaker::Company.name }
    tags { FFaker::Lorem.words(number: 4).join(', ') }

    # Array attributes
    options { [{ name: 'Color', values: ['Red', 'Blue', 'Green'] }, { name: 'Size', values: ['S', 'M', 'L'] }] }
    variants { build_list(:shopify_variant, 3) }
    images { build_list(:shopify_image, 3) }

    # Traits
    trait :with_variants do
      variants { build_list(:shopify_variant, 3) }
    end

    trait :without_variants do
      variants { [] }
    end

    trait :published do
      published_at { FFaker::Time.date }
    end

    trait :unpublished do
      published_at { nil }
    end
  end
end