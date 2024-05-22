# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_storefront_access_token, class: 'ShopifyAPI::StorefrontAccessToken' do
    title { FFaker::Lorem.sentence }
    access_scope { FFaker::Lorem.word }
    access_token { FFaker::Lorem.characters(20) }
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }

    trait :with_custom_scope do
      access_scope { 'custom_scope' }
    end

    trait :with_long_token do
      access_token { FFaker::Lorem.characters(40) }
    end

    trait :recently_created do
      created_at { FFaker::Time.datetime }
    end

    trait :not_recently_created do
      created_at { FFaker::Time.datetime - 1.year }
    end
  end
end