# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_carrier_service, class: 'ShopifyAPI::CarrierService' do
    active { FFaker::Boolean.random }
    admin_graphql_api_id { FFaker::Lorem.characters(10) }
    callback_url { FFaker::Internet.http_url }
    carrier_service_type { %w[api manual].sample }
    format { %w[json xml].sample }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Company.name }
    service_discovery { FFaker::Boolean.random }

    trait :active do
      active { true }
    end

    trait :inactive do
      active { false }
    end

    trait :with_service_discovery do
      service_discovery { true }
    end

    trait :without_service_discovery do
      service_discovery { false }
    end
  end
end