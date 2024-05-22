# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_currency, class: 'ShopifyAPI::Currency' do
    currency { FFaker::Currency.code }
    rate_updated_at { FFaker::Time.datetime }

    trait :recently_updated do
      rate_updated_at { FFaker::Time.datetime }
    end

    trait :not_recently_updated do
      rate_updated_at { FFaker::Time.datetime - 1.year }
    end
  end
end