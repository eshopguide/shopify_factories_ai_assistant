#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payment_gateway, class: 'ShopifyAPI::PaymentGateway' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { "Gateway #{FFaker::Product.brand}" }
    service_name { "Service #{FFaker::Company.name}" }
    type { ['direct', 'offsite'].sample }
    processing_method { ['checkout', 'direct', 'manual', 'offsite'].sample }
    provider_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    sandbox { FFaker::Boolean.random }
    disabled { FFaker::Boolean.random }
    supports_network_tokenization { FFaker::Boolean.random }

    # Array attributes
    enabled_card_brands { ['visa', 'master', 'amex'].sample(2) }

    # Traits
    trait :sandbox_enabled do
      sandbox { true }
    end

    trait :sandbox_disabled do
      sandbox { false }
    end

    trait :disabled_gateway do
      disabled { true }
    end

    trait :enabled_gateway do
      disabled { false }
    end

    trait :supports_tokenization do
      supports_network_tokenization { true }
    end

    trait :does_not_support_tokenization do
      supports_network_tokenization { false }
    end
  end
end