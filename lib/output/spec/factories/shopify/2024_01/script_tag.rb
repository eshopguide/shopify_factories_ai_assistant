#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_script_tag, class: 'ShopifyAPI::ScriptTag' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    event { ['onload', 'onunload', 'onchange'].sample }
    src { FFaker::Internet.http_url }
    cache { FFaker::Boolean.random }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    display_scope { ['all', 'shop', 'checkout'].sample }

    # Traits
    trait :with_cache do
      cache { true }
    end

    trait :without_cache do
      cache { false }
    end

    trait :for_all_pages do
      display_scope { 'all' }
    end

    trait :for_shop_pages do
      display_scope { 'shop' }
    end

    trait :for_checkout_pages do
      display_scope { 'checkout' }
    end
  end
end