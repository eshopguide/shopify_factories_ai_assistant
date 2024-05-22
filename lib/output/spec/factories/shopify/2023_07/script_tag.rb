# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_script_tag, class: 'ShopifyAPI::ScriptTag' do
    event { %w[onload onclick].sample }
    src { FFaker::Internet.http_url }
    cache { FFaker::Boolean.random }
    created_at { FFaker::Time.datetime }
    display_scope { %w[all order_status].sample }
    id { FFaker::Random.rand(1..1000) }
    updated_at { FFaker::Time.datetime }

    trait :with_cache do
      cache { true }
    end

    trait :without_cache do
      cache { false }
    end

    trait :onload_event do
      event { 'onload' }
    end

    trait :onclick_event do
      event { 'onclick' }
    end

    trait :all_display_scope do
      display_scope { 'all' }
    end

    trait :order_status_display_scope do
      display_scope { 'order_status' }
    end
  end
end