```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_image, class: 'ShopifyAPI::Image' do
    created_at { FFaker::Time.datetime }
    height { FFaker::Random.rand(100..1000) }
    id { FFaker::Random.rand(1..1000) }
    position { FFaker::Random.rand(1..10) }
    product_id { FFaker::Random.rand(1..1000) }
    src { FFaker::Internet.http_url }
    updated_at { FFaker::Time.datetime }
    variant_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    width { FFaker::Random.rand(100..1000) }

    trait :with_variants do
      variant_ids { [FFaker::Random.rand(1..1000), FFaker::Random.rand(1..1000)] }
    end

    trait :without_variants do
      variant_ids { [] }
    end
  end
end
```