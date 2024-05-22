#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_apple_pay_certificate, class: 'ShopifyAPI::ApplePayCertificate' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    merchant_id { FFaker::IdentificationESCO.nif }
    status { ['active', 'inactive', 'pending'].sample }

    # Traits
    trait :active do
      status { 'active' }
    end

    trait :inactive do
      status { 'inactive' }
    end

    trait :pending do
      status { 'pending' }
    end
  end
end