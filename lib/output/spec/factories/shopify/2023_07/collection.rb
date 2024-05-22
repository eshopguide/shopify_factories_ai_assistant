# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_collection, class: 'ShopifyAPI::Collection' do
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    handle { FFaker::Internet.slug }
    id { FFaker::Random.rand(1..1000) }
    published_at { FFaker::Time.datetime }
    published_scope { %w[web global].sample }
    sort_order { %w[manual best-selling title-ascending title-descending price-ascending price-descending created-ascending created-descending].sample }
    template_suffix { FFaker::Lorem.word }
    updated_at { FFaker::Time.datetime }

    association :image, factory: :shopify_image

    trait :published do
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published_at { nil }
    end

    trait :with_custom_template do
      template_suffix { 'custom' }
    end
  end
end