```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_comment, class: 'ShopifyAPI::Comment' do
    article_id { FFaker::Random.rand(1..1000) }
    author { FFaker::Name.name }
    blog_id { FFaker::Random.rand(1..1000) }
    body { FFaker::Lorem.paragraph }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    email { FFaker::Internet.email }
    id { FFaker::Random.rand(1..1000) }
    ip { FFaker::Internet.ip_v4_address }
    published_at { FFaker::Time.datetime }
    status { %w[published pending spam].sample }
    updated_at { FFaker::Time.datetime }
    user_agent { FFaker::Internet.user_agent }

    trait :published do
      status { 'published' }
    end

    trait :pending do
      status { 'pending' }
    end

    trait :spam do
      status { 'spam' }
    end
  end
end
```