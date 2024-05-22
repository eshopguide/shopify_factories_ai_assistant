# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_image, class: 'ShopifyAPI::Image' do
    created_at { FFaker::Time.datetime }
    height { FFaker::Random.rand(100..1000) }
    id { FFaker::Random.rand(1..1000) }
    position { FFaker::Random.rand(1..10) }
    product_id { FFaker::Random.rand(1..1000) }
    src { FFaker::Image.url }
    updated_at { FFaker::Time.datetime }
    variant_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    width { FFaker::Random.rand(100..1000) }

    trait :with_high_resolution do
      height { FFaker::Random.rand(1001..2000) }
      width { FFaker::Random.rand(1001..2000) }
    end

    trait :with_low_resolution do
      height { FFaker::Random.rand(1..99) }
      width { FFaker::Random.rand(1..99) }
    end

    trait :with_multiple_variants do
      variant_ids { Array.new(3) { FFaker::Random.rand(1..1000) } }
    end
  end
end