#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_dispute_evidence, class: 'ShopifyAPI::DisputeEvidence' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    payments_dispute_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.date }
    updated_on { FFaker::Time.date }
    customer_email_address { FFaker::Internet.email }
    customer_first_name { FFaker::Name.first_name }
    customer_last_name { FFaker::Name.last_name }
    access_activity_log { FFaker::Lorem.sentence }
    cancellation_policy_disclosure { FFaker::Lorem.sentence }
    cancellation_rebuttal { FFaker::Lorem.sentence }
    refund_policy_disclosure { FFaker::Lorem.sentence }
    refund_refusal_explanation { FFaker::Lorem.sentence }
    uncategorized_text { FFaker::Lorem.sentence }
    submitted { FFaker::Boolean.random }

    # Hash attributes
    billing_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    shipping_address { { address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    product_description { { description: FFaker::Lorem.paragraph } }
    dispute_evidence_files { { file_url: FFaker::Internet.http_url } }

    # Array attributes
    fulfillments { [{ tracking_number: FFaker::Vehicle.vin, tracking_url: FFaker::Internet.http_url, shipment_status: 'delivered', delivery_date: FFaker::Time.date }] }
  end
end