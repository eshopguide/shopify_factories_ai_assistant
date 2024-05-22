```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_page, class: 'ShopifyAPI::Page' do
    admin_graphql_api_id { FFaker::Lorem.characters(10) }
    author { FFaker::Name.name }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    handle { FFaker::Lorem.word }
    id { FFaker::Random.rand(1..1000) }
    published_at { FFaker::Time.datetime }
    shop_id { FFaker::Random.rand(1..1000) }
    template_suffix { FFaker::Lorem.word }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }

    association :metafield, factory: :shopify_metafield

    trait :published do
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published_at { nil }
    end

    trait :with_template_suffix do
      template_suffix { FFaker::Lorem.word }
    end

    trait :with_author do
      author { FFaker::Name.name }
    end
  end
end
```