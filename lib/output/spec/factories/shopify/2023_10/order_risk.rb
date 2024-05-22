```ruby
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

    trait :high_risk do
      score { FFaker::Random.rand(0.8..1.0).round(2).to_s }
      recommendation { 'cancel' }
    end

    trait :medium_risk do
      score { FFaker::Random.rand(0.4..0.79).round(2).to_s }
      recommendation { 'investigate' }
    end

    trait :low_risk do
      score { FFaker::Random.rand(0.0..0.39).round(2).to_s }
      recommendation { 'accept' }
    end
  end
end
```