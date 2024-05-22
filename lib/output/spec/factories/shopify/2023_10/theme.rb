```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_theme, class: 'ShopifyAPI::Theme' do
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Lorem.word }
    previewable { FFaker::Boolean.random }
    processing { FFaker::Boolean.random }
    role { %w[main unpublished].sample }
    src { FFaker::Internet.http_url }
    theme_store_id { FFaker::Random.rand(1..1000) }
    updated_at { FFaker::Time.datetime }

    trait :main do
      role { 'main' }
    end

    trait :unpublished do
      role { 'unpublished' }
    end

    trait :previewable do
      previewable { true }
    end

    trait :non_previewable do
      previewable { false }
    end

    trait :processing do
      processing { true }
    end

    trait :not_processing do
      processing { false }
    end
  end
end
```