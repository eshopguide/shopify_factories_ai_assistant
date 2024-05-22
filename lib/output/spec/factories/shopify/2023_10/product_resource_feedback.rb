```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_product_resource_feedback, class: 'ShopifyAPI::ProductResourceFeedback' do
    created_at { FFaker::Time.datetime }
    feedback_generated_at { FFaker::Time.datetime }
    messages { [FFaker::Lorem.sentence, FFaker::Lorem.sentence] }
    product_id { FFaker::Random.rand(1..1000) }
    resource_id { FFaker::Random.rand(1..1000) }
    resource_type { %w[Product Variant].sample }
    resource_updated_at { FFaker::Time.datetime }
    state { %w[success error].sample }
    updated_at { FFaker::Time.datetime }

    trait :success do
      state { 'success' }
    end

    trait :error do
      state { 'error' }
    end

    trait :with_messages do
      messages { [FFaker::Lorem.sentence, FFaker::Lorem.sentence] }
    end
  end
end
```