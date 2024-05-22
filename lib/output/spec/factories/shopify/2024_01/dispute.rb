#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_dispute, class: 'ShopifyAPI::Dispute' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    amount { FFaker::Random.rand(100..1000).to_s }
    currency { FFaker::Currency.code }
    reason { ['fraudulent', 'unrecognized', 'duplicate', 'subscription_canceled', 'product_unacceptable', 'product_not_received', 'credit_not_processed', 'general'].sample }
    status { ['needs_response', 'under_review', 'charge_refunded', 'won', 'lost'].sample }
    type { ['inquiry', 'chargeback', 'pre_arbitration'].sample }
    evidence_due_by { FFaker::Time.date }
    evidence_sent_on { FFaker::Time.date }
    finalized_on { FFaker::Time.date }
    network_reason_code { FFaker::Lorem.word }

    # Traits
    trait :needs_response do
      status { 'needs_response' }
    end

    trait :under_review do
      status { 'under_review' }
    end

    trait :won do
      status { 'won' }
    end

    trait :lost do
      status { 'lost' }
    end
  end
end