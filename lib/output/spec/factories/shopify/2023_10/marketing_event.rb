```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_marketing_event, class: 'ShopifyAPI::MarketingEvent' do
    event_type { %w[ad campaign email social].sample }
    marketing_channel { %w[facebook google instagram].sample }
    paid { FFaker::Boolean.random }
    started_at { FFaker::Time.datetime }
    UTM_parameters { { source: FFaker::Internet.domain_name, medium: FFaker::Lorem.word, campaign: FFaker::Lorem.word } }
    budget { FFaker::Number.decimal }
    budget_type { %w[daily total].sample }
    currency { FFaker::Currency.code }
    description { FFaker::Lorem.sentence }
    ended_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    manage_url { FFaker::Internet.http_url }
    marketed_resources { [{ id: FFaker::Random.rand(1..1000), type: 'Product' }] }
    preview_url { FFaker::Internet.http_url }
    referring_domain { FFaker::Internet.domain_name }
    remote_id { FFaker::Lorem.characters(10) }
    scheduled_to_end_at { FFaker::Time.datetime }

    trait :paid do
      paid { true }
    end

    trait :unpaid do
      paid { false }
    end

    trait :with_description do
      description { FFaker::Lorem.sentence }
    end

    trait :with_manage_url do
      manage_url { FFaker::Internet.http_url }
    end

    trait :with_preview_url do
      preview_url { FFaker::Internet.http_url }
    end
  end
end
```