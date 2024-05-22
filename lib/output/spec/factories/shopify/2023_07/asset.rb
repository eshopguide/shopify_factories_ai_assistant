# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_asset, class: 'ShopifyAPI::Asset' do
    attachment { FFaker::Lorem.characters(20) }
    checksum { FFaker::Lorem.characters(32) }
    content_type { FFaker::Internet.mime_type }
    created_at { FFaker::Time.datetime }
    key { FFaker::Lorem.word }
    public_url { FFaker::Internet.http_url }
    size { FFaker::Random.rand(1..1000) }
    theme_id { FFaker::Random.rand(1..1000) }
    updated_at { FFaker::Time.datetime }
    value { FFaker::Lorem.paragraph }

    trait :with_large_size do
      size { FFaker::Random.rand(1001..5000) }
    end

    trait :with_small_size do
      size { FFaker::Random.rand(1..100) }
    end
  end
end