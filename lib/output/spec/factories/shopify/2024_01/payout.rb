#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_payout, class: 'ShopifyAPI::Payout' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    amount { FFaker::Random.rand(100.00..10000.00).round(2).to_s }
    currency { FFaker::Currency.code }
    date { FFaker::Time.date }
    status { ['scheduled', 'in_transit', 'paid', 'failed', 'cancelled'].sample }

    # Traits
    trait :scheduled do
      status { 'scheduled' }
    end

    trait :in_transit do
      status { 'in_transit' }
    end

    trait :paid do
      status { 'paid' }
    end

    trait :failed do
      status { 'failed' }
    end

    trait :cancelled do
      status { 'cancelled' }
    end
  end
end