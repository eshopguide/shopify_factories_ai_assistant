```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_smart_collection, class: 'ShopifyAPI::SmartCollection' do
    rules { [{ column: 'title', relation: 'equals', condition: FFaker::Lorem.word }] }
    title { FFaker::Lorem.sentence }
    body_html { FFaker::Lorem.paragraph }
    disjunctive { FFaker::Boolean.random }
    handle { FFaker::Lorem.word }
    id { FFaker::Random.rand(1..1000) }
    published_at { FFaker::Time.datetime }
    published_scope { %w[web global].sample }
    sort_order { %w[alpha best-selling created].sample }
    template_suffix { FFaker::Lorem.word }
    updated_at { FFaker::Time.datetime }

    trait :published do
      published_at { FFaker::Time.datetime }
    end

    trait :unpublished do
      published_at { nil }
    end

    trait :with_image do
      image { { src: FFaker::Avatar.image } }
    end

    trait :with_template_suffix do
      template_suffix { FFaker::Lorem.word }
    end

    trait :disjunctive do
      disjunctive { true }
    end

    trait :conjunctive do
      disjunctive { false }
    end
  end
end
```