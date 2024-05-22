#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_marketing_event, class: 'ShopifyAPI::MarketingEvent' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    event_type { ['ad_campaign', 'email', 'social', 'direct_mail'].sample }
    marketing_channel { ['search', 'display', 'social', 'email'].sample }
    paid { FFaker::Boolean.random }
    started_at { FFaker::Time.date }
    ended_at { FFaker::Time.date }
    budget { FFaker::Random.rand(100..1000).to_s }
    budget_type { ['daily', 'lifetime'].sample }
    currency { FFaker::Currency.code }
    description { FFaker::Lorem.sentence }
    manage_url { FFaker::Internet.http_url }
    preview_url { FFaker::Internet.http_url }
    referring_domain { FFaker::Internet.domain_name }
    remote_id { FFaker::Lorem.characters(10) }
    scheduled_to_end_at { FFaker::Time.date + 10 }
    UTM_parameters { { utm_source: 'newsletter', utm_medium: 'email', utm_campaign: 'spring_sale' } }

    # Array attributes
    marketed_resources { [{ type: 'product', id: FFaker::Random.rand(1..1000) }] }

    # Traits
    trait :with_high_budget do
      budget { FFaker::Random.rand(1000..5000).to_s }
      budget_type { 'lifetime' }
    end

    trait :with_low_budget do
      budget { FFaker::Random.rand(10..100).to_s }
      budget_type { 'daily' }
    end

    trait :paid_event do
      paid { true }
    end

    trait :free_event do
      paid { false }
    end
  end
end