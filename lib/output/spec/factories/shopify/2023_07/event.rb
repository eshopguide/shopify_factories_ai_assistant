# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_event, class: 'ShopifyAPI::Event' do
    arguments { [FFaker::Lorem.word, FFaker::Lorem.word] }
    body { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    description { FFaker::Lorem.sentence }
    id { FFaker::Random.rand(1..1000) }
    message { FFaker::Lorem.sentence }
    path { FFaker::Internet.http_url }
    subject_id { FFaker::Random.rand(1..1000) }
    subject_type { %w[Order Product Customer].sample }
    verb { %w[create update delete].sample }

    trait :with_order_subject do
      subject_type { 'Order' }
    end

    trait :with_product_subject do
      subject_type { 'Product' }
    end

    trait :with_customer_subject do
      subject_type { 'Customer' }
    end

    trait :created do
      verb { 'create' }
    end

    trait :updated do
      verb { 'update' }
    end

    trait :deleted do
      verb { 'delete' }
    end
  end
end