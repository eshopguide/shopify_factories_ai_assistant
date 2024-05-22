# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_report, class: 'ShopifyAPI::Report' do
    category { %w[sales customers products].sample }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Lorem.sentence }
    shopify_ql { FFaker::Lorem.paragraph }
    updated_at { FFaker::Time.datetime }

    trait :sales_category do
      category { 'sales' }
    end

    trait :customers_category do
      category { 'customers' }
    end

    trait :products_category do
      category { 'products' }
    end

    trait :recently_updated do
      updated_at { FFaker::Time.datetime }
    end

    trait :not_recently_updated do
      updated_at { FFaker::Time.datetime - 1.year }
    end
  end
end