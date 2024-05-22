#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_carrier_service, class: 'ShopifyAPI::CarrierService' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Company.name }
    active { FFaker::Boolean.random }
    callback_url { FFaker::Internet.http_url }
    carrier_service_type { ['api', 'legacy'].sample }
    format { ['json', 'xml'].sample }
    service_discovery { FFaker::Boolean.random }

    # Traits
    trait :active do
      active { true }
    end

    trait :inactive do
      active { false }
    end

    trait :api_type do
      carrier_service_type { 'api' }
    end

    trait :legacy_type do
      carrier_service_type { 'legacy' }
    end

    trait :json_format do
      format { 'json' }
    end

    trait :xml_format do
      format { 'xml' }
    end
  end
end