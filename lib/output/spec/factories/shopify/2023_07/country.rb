# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_country, class: 'ShopifyAPI::Country' do
    code { FFaker::Address.country_code }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Address.country }
    tax { FFaker::Number.decimal }

    association :provinces, factory: :shopify_province

    trait :with_high_tax do
      tax { FFaker::Number.decimal(l_digits: 2) }
    end

    trait :with_low_tax do
      tax { FFaker::Number.decimal(l_digits: 1) }
    end
  end
end