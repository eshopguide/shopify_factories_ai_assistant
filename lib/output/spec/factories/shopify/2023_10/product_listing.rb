```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_product_listing, class: 'ShopifyAPI::ProductListing' do
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    handle { FFaker::Lorem.word }
    product_id { FFaker::Random.rand(1..1000) }
    product_type { FFaker::Product.product }
    published_at { FFaker::Time.datetime }
    tags { FFaker::Lorem.words.join(', ') }
    title { FFaker::Product.product_name }
    updated_at { FFaker::Time.datetime }
    vendor { FFaker::Company.name }

    images { build_list(:shopify_image, 2) }
    variants { build_list(:shopify_variant, 3) }

    trait :published do
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published_at { nil }
    end

    trait :with_tags do
      tags { FFaker::Lorem.words.join(', ') }
    end

    trait :with_options do
      options { [{ name: FFaker::Lorem.word, values: [FFaker::Lorem.word, FFaker::Lorem.word] }] }
    end
  end
end
```