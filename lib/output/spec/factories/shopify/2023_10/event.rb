```ruby
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
```