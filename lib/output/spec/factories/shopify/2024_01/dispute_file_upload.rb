#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_dispute_file_upload, class: 'ShopifyAPI::DisputeFileUpload' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    dispute_evidence_id { FFaker::Random.rand(1..1000) }
    shop_id { FFaker::Random.rand(1..1000) }
    filename { FFaker::Filesystem.file_name(dir: 'documents', name: 'evidence', ext: 'pdf') }
    original_filename { FFaker::Filesystem.file_name(dir: 'originals', name: 'original_evidence', ext: 'pdf') }
    file_type { 'application/pdf' }
    file_size { FFaker::Random.rand(1000..10000) }
    url { FFaker::Internet.http_url }
    dispute_evidence_type { ['receipt', 'invoice', 'proof_of_delivery', 'customer_communication'].sample }

    # Traits
    trait :large_file do
      file_size { FFaker::Random.rand(10000..20000) }
    end

    trait :small_file do
      file_size { FFaker::Random.rand(100..999) }
    end
  end
end