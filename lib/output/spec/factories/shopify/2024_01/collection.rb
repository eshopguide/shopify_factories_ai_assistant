#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_collection, class: 'ShopifyAPI::Collection' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    handle { FFaker::Internet.slug }
    published_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    published_scope { ['web', 'global'].sample }
    sort_order { ['best-selling', 'alpha-asc', 'alpha-desc', 'price-asc', 'price-desc'].sample }
    template_suffix { FFaker::Lorem.word }

    # Associations
    image { association :shopify_image }

    # Traits
    trait :published do
      published_at { FFaker::Time.date }
    end

    trait :unpublished do
      published_at { nil }
    end
  end
end