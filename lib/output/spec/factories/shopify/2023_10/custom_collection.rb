```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_custom_collection, class: 'ShopifyAPI::CustomCollection' do
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    handle { FFaker::Lorem.word }
    id { FFaker::Random.rand(1..1000) }
    published { FFaker::Boolean.random }
    published_at { FFaker::Time.datetime }
    published_scope { %w[web global].sample }
    sort_order { %w[alpha best-selling created].sample }
    template_suffix { FFaker::Lorem.word }
    updated_at { FFaker::Time.datetime }

    trait :published do
      published { true }
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published { false }
      published_at { nil }
    end

    trait :with_image do
      image { { src: FFaker::Avatar.image } }
    end
  end
end
```