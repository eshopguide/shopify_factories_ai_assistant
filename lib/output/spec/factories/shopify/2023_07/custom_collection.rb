# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_custom_collection, class: 'ShopifyAPI::CustomCollection' do
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    handle { FFaker::Internet.slug }
    id { FFaker::Random.rand(1..1000) }
    image { { src: FFaker::Image.url, alt: FFaker::Lorem.word } }
    published { FFaker::Boolean.random }
    published_at { FFaker::Time.datetime }
    published_scope { %w[web global].sample }
    sort_order { %w[manual best-selling title-ascending title-descending price-ascending price-descending created-ascending created-descending].sample }
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

    trait :with_custom_template do
      template_suffix { 'custom' }
    end
  end
end