#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_currency, class: 'ShopifyAPI::Currency' do
    # Basic attributes
    currency { FFaker::Currency.code }
    rate_updated_at { FFaker::Time.date }
  end
end