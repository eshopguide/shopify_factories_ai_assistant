#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_page, class: 'ShopifyAPI::Page' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    published_at { FFaker::Time.date }
    handle { FFaker::Internet.slug }
    shop_id { FFaker::Random.rand(1..1000) }
    template_suffix { 'page.contact' }
    author { FFaker::Name.name }

    # Associations
    metafield { association :shopify_metafield }

    # Traits
    trait :published do
      published_at { FFaker::Time.date }
    end

    trait :unpublished do
      published_at { nil }
    end
  end
end