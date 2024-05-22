# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_smart_collection, class: 'ShopifyAPI::SmartCollection' do
    rules { [{ column: FFaker::Lorem.word, relation: %w[equals not_equals greater_than less_than].sample, condition: FFaker::Lorem.word }] }
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    disjunctive { FFaker::Boolean.random }
    handle { FFaker::Internet.slug }
    id { FFaker::Random.rand(1..1000) }
    image { { src: FFaker::Image.url, alt: FFaker::Lorem.word } }
    published_at { FFaker::Time.datetime }
    published_scope { %w[web global].sample }
    sort_order { %w[manual best-selling title-ascending title-descending price-ascending price-descending created-ascending created-descending].sample }
    template_suffix { FFaker::Lorem.word }
    updated_at { FFaker::Time.datetime }

    trait :published do
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published_at { nil }
    end

    trait :with_custom_template do
      template_suffix { 'custom' }
    end

    trait :disjunctive do
      disjunctive { true }
    end

    trait :conjunctive do
      disjunctive { false }
    end

    trait :with_multiple_rules do
      rules { Array.new(3) { { column: FFaker::Lorem.word, relation: %w[equals not_equals greater_than less_than].sample, condition: FFaker::Lorem.word } } }
    end
  end
end