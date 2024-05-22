# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_apple_pay_certificate, class: 'ShopifyAPI::ApplePayCertificate' do
    merchant_id { FFaker::Lorem.characters(10) }
    status { %w[active inactive].sample }

    trait :active do
      status { 'active' }
    end

    trait :inactive do
      status { 'inactive' }
    end
  end
end