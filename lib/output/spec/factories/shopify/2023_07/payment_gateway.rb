# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payment_gateway, class: 'ShopifyAPI::PaymentGateway' do
    attachment { FFaker::Lorem.characters(20) }
    created_at { FFaker::Time.datetime }
    credential1 { FFaker::Lorem.characters(10) }
    credential2 { FFaker::Lorem.characters(10) }
    credential3 { FFaker::Lorem.characters(10) }
    credential4 { FFaker::Lorem.characters(10) }
    disabled { FFaker::Boolean.random }
    enabled_card_brands { [FFaker::Payment.card_type, FFaker::Payment.card_type] }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Company.name }
    processing_method { %w[direct redirect].sample }
    provider_id { FFaker::Random.rand(1..1000) }
    sandbox { FFaker::Boolean.random }
    service_name { FFaker::Company.name }
    supports_network_tokenization { FFaker::Boolean.random }
    type { %w[manual automatic].sample }
    updated_at { FFaker::Time.datetime }

    trait :with_sandbox do
      sandbox { true }
    end

    trait :without_sandbox do
      sandbox { false }
    end

    trait :with_network_tokenization do
      supports_network_tokenization { true }
    end

    trait :without_network_tokenization do
      supports_network_tokenization { false }
    end

    trait :disabled do
      disabled { true }
    end

    trait :enabled do
      disabled { false }
    end
  end
end