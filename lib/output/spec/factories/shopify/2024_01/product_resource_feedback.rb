#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_product_resource_feedback, class: 'ShopifyAPI::ProductResourceFeedback' do
    # Basic attributes
    product_id { FFaker::Random.rand(1..1000) }
    resource_id { FFaker::Random.rand(1..1000) }
    resource_type { ['image', 'variant', 'description'].sample }
    state { ['approved', 'pending', 'rejected'].sample }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    feedback_generated_at { FFaker::Time.date }
    resource_updated_at { FFaker::Time.date }

    # Array attributes
    messages { Array.new(3) { FFaker::Lorem.sentence } }

    # Traits
    trait :approved do
      state { 'approved' }
    end

    trait :pending do
      state { 'pending' }
    end

    trait :rejected do
      state { 'rejected' }
    end
  end
end