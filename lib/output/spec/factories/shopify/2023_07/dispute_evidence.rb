# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_dispute_evidence, class: 'ShopifyAPI::DisputeEvidence' do
    access_activity_log { FFaker::Lorem.paragraph }
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    cancellation_policy_disclosure { FFaker::Lorem.paragraph }
    cancellation_rebuttal { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    customer_email_address { FFaker::Internet.email }
    customer_first_name { FFaker::Name.first_name }
    customer_last_name { FFaker::Name.last_name }
    dispute_evidence_files { { file1: FFaker::Lorem.word, file2: FFaker::Lorem.word } }
    fulfillments { [{ fulfillment_id: FFaker::Random.rand(1..1000), status: %w[pending shipped delivered].sample }] }
    id { FFaker::Random.rand(1..1000) }
    payments_dispute_id { FFaker::Random.rand(1..1000) }
    product_description { { description: FFaker::Lorem.paragraph } }
    refund_policy_disclosure { FFaker::Lorem.paragraph }
    refund_refusal_explanation { FFaker::Lorem.paragraph }
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    submitted { FFaker::Boolean.random }
    uncategorized_text { FFaker::Lorem.paragraph }
    updated_on { FFaker::Time.datetime }

    trait :submitted do
      submitted { true }
    end

    trait :not_submitted do
      submitted { false }
    end

    trait :with_multiple_fulfillments do
      fulfillments { Array.new(3) { { fulfillment_id: FFaker::Random.rand(1..1000), status: %w[pending shipped delivered].sample } } }
    end
  end
end