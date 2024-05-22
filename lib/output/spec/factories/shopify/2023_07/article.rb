# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_article, class: 'ShopifyAPI::Article' do
    author { FFaker::Name.name }
    blog_id { FFaker::Random.rand(1..1000) }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    handle { FFaker::Internet.slug }
    id { FFaker::Random.rand(1..1000) }
    image { FFaker::Image.url }
    published { FFaker::Boolean.random }
    published_at { FFaker::Time.datetime }
    summary_html { FFaker::Lorem.sentence }
    tags { FFaker::Lorem.words.join(', ') }
    template_suffix { FFaker::Lorem.word }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }
    user_id { FFaker::Random.rand(1..1000) }

    association :metafields, factory: :shopify_metafield

    trait :published do
      published { true }
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published { false }
      published_at { nil }
    end

    trait :with_image do
      image { { src: FFaker::Image.url, alt: FFaker::Lorem.word } }
    end
  end
end