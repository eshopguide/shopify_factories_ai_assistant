#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_asset, class: 'ShopifyAPI::Asset' do
    # Basic attributes
    theme_id { FFaker::Random.rand(1..1000) }
    key { FFaker::Lorem.words(number: 2).join('/') + ".liquid" }
    public_url { FFaker::Internet.http_url }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }

    # Content attributes
    content_type { ['text/css', 'text/html', 'image/png', 'application/javascript'].sample }
    value { FFaker::Lorem.paragraph }
    attachment { Base64.encode64(FFaker::Lorem.paragraph) }
    size { FFaker::Random.rand(1000..5000) }
    checksum { Digest::MD5.hexdigest(FFaker::Lorem.paragraph) }

    # Traits
    trait :css do
      content_type { 'text/css' }
      key { FFaker::Lorem.words(number: 2).join('/') + ".css" }
    end

    trait :html do
      content_type { 'text/html' }
      key { FFaker::Lorem.words(number: 2).join('/') + ".html" }
    end

    trait :image do
      content_type { 'image/png' }
      key { FFaker::Lorem.words(number: 2).join('/') + ".png" }
    end

    trait :javascript do
      content_type { 'application/javascript' }
      key { FFaker::Lorem.words(number: 2).join('/') + ".js" }
    end
  end
end