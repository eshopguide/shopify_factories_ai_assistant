#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_smart_collection, class: 'ShopifyAPI::SmartCollection' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    title { "Spring Collection" }
    body_html { FFaker::Lorem.paragraph }
    handle { FFaker::Internet.slug }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    published_at { FFaker::Time.date }
    sort_order { "best-selling" }
    disjunctive { FFaker::Boolean.random }

    # Array attributes
    rules { [{ column: "type", relation: "equals", condition: "Shirt" }] }
    image { { src: FFaker::Image.url, alt: "Spring Collection" } }

    # Traits
    trait :with_disjunctive_rules do
      disjunctive { true }
      rules { [{ column: "type", relation: "equals", condition: "Shirt" }, { column: "price", relation: "greater_than", condition: "100" }] }
    end

    trait :without_disjunctive_rules do
      disjunctive { false }
      rules { [{ column: "vendor", relation: "equals", condition: "Nike" }] }
    end

    trait :published do
      published_at { FFaker::Time.date }
    end

    trait :unpublished do
      published_at { nil }
    end
  end
end