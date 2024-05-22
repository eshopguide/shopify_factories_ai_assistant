#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_product, class: 'ShopifyAPI::Product' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    title { FFaker::Product.product_name }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    handle { FFaker::Internet.slug }
    product_type { ['Clothing', 'Accessories', 'Footwear'].sample }
    vendor { FFaker::Company.name }
    published_at { FFaker::Time.date }
    status { ['active', 'archived', 'draft'].sample }

    # Array attributes
    tags { FFaker::Lorem.words(number: 4).join(', ') }
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