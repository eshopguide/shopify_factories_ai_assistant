#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_event, class: 'ShopifyAPI::Event' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.date }
    subject_id { FFaker::Random.rand(1..1000) }
    subject_type { ['Order', 'Product', 'Customer'].sample }
    verb { ['create', 'update', 'delete'].sample }
    arguments { [FFaker::Lorem.word, FFaker::Lorem.word] }
    description { FFaker::Lorem.sentence }
    message { FFaker::Lorem.sentence }
    path { "/admin/#{subject_type.downcase}s/#{subject_id}.json" }
    body { FFaker::Lorem.paragraph }

    # Traits
    trait :order_event do
      subject_type { 'Order' }
    end

    trait :product_event do
      subject_type { 'Product' }
    end

    trait :customer_event do
      subject_type { 'Customer' }
    end
  end
end