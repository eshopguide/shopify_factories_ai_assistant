#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_image, class: 'ShopifyAPI::Image' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    product_id { FFaker::Random.rand(1..1000) }
    position { FFaker::Random.rand(1..10) }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    src { FFaker::Image.url }
    width { FFaker::Random.rand(100..1000) }
    height { FFaker::Random.rand(100..1000) }

    # Array attributes
    variant_ids { Array.new(FFaker::Random.rand(1..5)) { FFaker::Random.rand(1..1000) } }

    # Traits
    trait :with_variants do
      variant_ids { Array.new(FFaker::Random.rand(1..5)) { FFaker::Random.rand(1..1000) } }
    end

    trait :without_variants do
      variant_ids { [] }
    end
  end
end