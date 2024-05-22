#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_order_risk, class: 'ShopifyAPI::OrderRisk' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    message { FFaker::Lorem.sentence }
    score { FFaker::Random.rand(0.0..1.0).round(2).to_s }
    recommendation { ['cancel', 'investigate', 'accept'].sample }
    merchant_message { FFaker::Lorem.sentence }
    cause_cancel { FFaker::Boolean.random }
    display { FFaker::Boolean.random }

    # Traits
    trait :high_risk do
      score { '0.9' }
      recommendation { 'cancel' }
      cause_cancel { true }
    end

    trait :low_risk do
      score { '0.1' }
      recommendation { 'accept' }
      cause_cancel { false }
    end
  end
end