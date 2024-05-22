# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_order_risk, class: 'ShopifyAPI::OrderRisk' do
    cause_cancel { FFaker::Boolean.random }
    checkout_id { FFaker::Random.rand(1..1000) }
    display { FFaker::Boolean.random }
    id { FFaker::Random.rand(1..1000) }
    merchant_message { FFaker::Lorem.sentence }
    message { FFaker::Lorem.sentence }
    order_id { FFaker::Random.rand(1..1000) }
    recommendation { %w[accept investigate cancel].sample }
    score { FFaker::Number.decimal }
    source { %w[internal external].sample }

    trait :with_high_score do
      score { FFaker::Number.decimal(l_digits: 2) }
    end

    trait :with_low_score do
      score { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :cause_cancel do
      cause_cancel { true }
    end

    trait :no_cause_cancel do
      cause_cancel { false }
    end

    trait :display do
      display { true }
    end

    trait :no_display do
      display { false }
    end
  end
end