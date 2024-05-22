```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_dispute_file_upload, class: 'ShopifyAPI::DisputeFileUpload' do
    dispute_evidence_id { FFaker::Random.rand(1..1000) }
    dispute_evidence_type { %w[document image].sample }
    file_size { FFaker::Random.rand(1000..5000) }
    file_type { %w[pdf jpg png].sample }
    filename { FFaker::Lorem.word }
    id { FFaker::Random.rand(1..1000) }
    original_filename { FFaker::Lorem.word }
    shop_id { FFaker::Random.rand(1..1000) }
    url { FFaker::Internet.http_url }

    trait :document do
      dispute_evidence_type { 'document' }
      file_type { 'pdf' }
    end

    trait :image do
      dispute_evidence_type { 'image' }
      file_type { %w[jpg png].sample }
    end
  end
end
```