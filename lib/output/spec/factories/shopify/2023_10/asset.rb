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

    trait :with_attachment do
      attachment { FFaker::Lorem.characters(20) }
    end

    trait :without_attachment do
      attachment { nil }
    end

    trait :with_public_url do
      public_url { FFaker::Internet.http_url }
    end

    trait :without_public_url do
      public_url { nil }
    end
  end
end