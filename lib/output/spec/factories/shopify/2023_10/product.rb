```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_product, class: 'ShopifyAPI::Product' do
    title { FFaker::Product.product_name }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    handle { FFaker::Lorem.word }
    id { FFaker::Random.rand(1..1000) }
    product_type { FFaker::Product.product }
    published_at { FFaker::Time.datetime }
    published_scope { %w[web global].sample }
    status { %w[active archived draft].sample }
    tags { FFaker::Lorem.words.join(', ') }
    template_suffix { FFaker::Lorem.word }
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

    trait :with_template_suffix do
      template_suffix { FFaker::Lorem.word }
    end
  end
end
```