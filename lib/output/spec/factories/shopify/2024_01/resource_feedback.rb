#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_resource_feedback, class: 'ShopifyAPI::ResourceFeedback' do
    # Basic attributes
    resource_id { FFaker::Random.rand(1..1000) }
    resource_type { ['product', 'collection', 'page'].sample }
    state { ['approved', 'pending', 'rejected'].sample }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    feedback_generated_at { FFaker::Time.date }

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