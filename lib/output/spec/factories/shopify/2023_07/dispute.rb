# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_dispute, class: 'ShopifyAPI::Dispute' do
    amount { FFaker::Number.decimal }
    currency { FFaker::Currency.code }
    evidence_due_by { FFaker::Time.datetime }
    evidence_sent_on { FFaker::Time.datetime }
    finalized_on { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    network_reason_code { FFaker::Lorem.characters(10) }
    order_id { FFaker::Random.rand(1..1000) }
    reason { %w[fraudulent unrecognized product_not_received product_unacceptable].sample }
    status { %w[won lost needs_response under_review].sample }
    type { %w[chargeback inquiry retrieval].sample }

    trait :won do
      status { 'won' }
    end

    trait :lost do
      status { 'lost' }
    end

    trait :needs_response do
      status { 'needs_response' }
    end

    trait :under_review do
      status { 'under_review' }
    end
  end
end