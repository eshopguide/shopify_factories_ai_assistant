#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_article, class: 'ShopifyAPI::Article' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    blog_id { FFaker::Random.rand(1..1000) }
    author { FFaker::Name.name }
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    published_at { FFaker::Time.date }
    handle { FFaker::Internet.slug }
    summary_html { FFaker::Lorem.paragraph }
    tags { FFaker::Lorem.words.join(', ') }
    template_suffix { FFaker::Lorem.word }
    user_id { FFaker::Random.rand(1..1000) }

    # Boolean attributes
    published { FFaker::Boolean.random }

    # Hash attributes for image
    image { { src: FFaker::Image.url, alt: FFaker::Lorem.word } }

    # Array attributes for metafields
    metafields { [{ namespace: 'global', key: 'description', value: FFaker::Lorem.sentence, value_type: 'string' }] }

    # Traits
    trait :published do
      published { true }
    end

    trait :unpublished do
      published { false }
    end
  end
end