#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_custom_collection, class: 'ShopifyAPI::CustomCollection' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    handle { FFaker::Internet.slug }
    published_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    published { FFaker::Boolean.random }
    published_scope { ['web', 'global'].sample }
    sort_order { ['best-selling', 'alpha-asc', 'alpha-desc', 'price-asc', 'price-desc'].sample }
    template_suffix { FFaker::Lorem.word }

    # Hash attributes for image
    image { { src: FFaker::Image.url, alt: FFaker::Lorem.word } }

    # Traits
    trait :published do
      published { true }
    end

    trait :unpublished do
      published { false }
    end
  end
end