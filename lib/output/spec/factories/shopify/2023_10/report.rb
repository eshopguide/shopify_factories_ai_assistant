```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_report, class: 'ShopifyAPI::Report' do
    category { %w[sales customers inventory].sample }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Lorem.sentence }
    shopify_ql { FFaker::Lorem.paragraph }
    updated_at { FFaker::Time.datetime }

    trait :sales do
      category { 'sales' }
    end

    trait :customers do
      category { 'customers' }
    end

    trait :inventory do
      category { 'inventory' }
    end

    trait :with_name do
      name { FFaker::Lorem.sentence }
    end

    trait :with_shopify_ql do
      shopify_ql { FFaker::Lorem.paragraph }
    end
  end
end
```