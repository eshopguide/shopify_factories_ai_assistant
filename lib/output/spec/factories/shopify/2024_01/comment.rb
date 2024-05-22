#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_comment, class: 'ShopifyAPI::Comment' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    article_id { FFaker::Random.rand(1..1000) }
    blog_id { FFaker::Random.rand(1..1000) }
    body { FFaker::Lorem.paragraph }
    body_html { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    published_at { FFaker::Time.date }
    author { FFaker::Name.name }
    email { FFaker::Internet.email }
    ip { FFaker::Internet.ip_v4_address }
    user_agent { FFaker::Internet.user_agent }
    status { ['published', 'unpublished', 'spam'].sample }

    # Traits
    trait :published do
      status { 'published' }
    end

    trait :unpublished do
      status { 'unpublished' }
    end

    trait :spam do
      status { 'spam' }
    end
  end
end