```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_collection, class: 'ShopifyAPI::Collection' do
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    handle { FFaker::Lorem.word }
    id { FFaker::Random.rand(1..1000) }
    published_at { FFaker::Time.datetime }
    published_scope { %w[web global].sample }
    sort_order { %w[alpha best-selling created].sample }
    template_suffix { FFaker::Lorem.word }
    updated_at { FFaker::Time.datetime }

    association :image, factory: :shopify_image

    trait :published do
      published_scope { 'web' }
    end

    trait :unpublished do
      published_scope { 'global' }
    end

    trait :with_custom_sort_order do
      sort_order { 'custom' }
    end
  end
end
```