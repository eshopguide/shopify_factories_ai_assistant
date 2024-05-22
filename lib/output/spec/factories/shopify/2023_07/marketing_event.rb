# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_marketing_event, class: 'ShopifyAPI::MarketingEvent' do
    event_type { %w[ad campaign email social].sample }
    marketing_channel { %w[google facebook instagram twitter].sample }
    paid { FFaker::Boolean.random }
    started_at { FFaker::Time.datetime }
    UTM_parameters { { source: FFaker::Internet.domain_name, medium: %w[cpc email social].sample, campaign: FFaker::Lorem.word } }
    budget { FFaker::Number.decimal }
    budget_type { %w[daily total].sample }
    currency { FFaker::Currency.code }
    description { FFaker::Lorem.sentence }
    ended_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    manage_url { FFaker::Internet.http_url }
    marketed_resources { [{ resource_id: FFaker::Random.rand(1..1000), resource_type: %w[product collection].sample }] }
    preview_url { FFaker::Internet.http_url }
    referring_domain { FFaker::Internet.domain_name }
    remote_id { FFaker::Lorem.characters(10) }
    scheduled_to_end_at { FFaker::Time.datetime }

    trait :with_high_budget do
      budget { FFaker::Number.decimal(l_digits: 3) }
    end

    trait :with_low_budget do
      budget { FFaker::Number.decimal(l_digits: 1) }
    end

    trait :paid do
      paid { true }
    end

    trait :unpaid do
      paid { false }
    end

    trait :with_multiple_resources do
      marketed_resources { Array.new(3) { { resource_id: FFaker::Random.rand(1..1000), resource_type: %w[product collection].sample } } }
    end
  end
end