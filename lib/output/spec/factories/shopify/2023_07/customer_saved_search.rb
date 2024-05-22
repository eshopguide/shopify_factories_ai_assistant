# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_customer_saved_search, class: 'ShopifyAPI::CustomerSavedSearch' do
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Lorem.sentence }
    query { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }

    trait :recently_updated do
      updated_at { FFaker::Time.datetime }
    end

    trait :not_recently_updated do
      updated_at { FFaker::Time.datetime - 1.year }
    end
  end
end