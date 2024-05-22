# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_policy, class: 'ShopifyAPI::Policy' do
    body { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    handle { FFaker::Internet.slug }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }
    url { FFaker::Internet.http_url }

    trait :with_long_body do
      body { FFaker::Lorem.paragraphs.join("\n\n") }
    end

    trait :with_short_body do
      body { FFaker::Lorem.sentence }
    end

    trait :recently_updated do
      updated_at { FFaker::Time.datetime }
    end

    trait :not_recently_updated do
      updated_at { FFaker::Time.datetime - 1.year }
    end
  end
end