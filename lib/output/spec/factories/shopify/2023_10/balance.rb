# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_balance, class: 'ShopifyAPI::Balance' do
    balance { [{ currency: FFaker::Currency.code, amount: FFaker::Number.decimal }] }

    trait :with_multiple_balances do
      balance { [{ currency: FFaker::Currency.code, amount: FFaker::Number.decimal }, { currency: FFaker::Currency.code, amount: FFaker::Number.decimal }] }
    end
  end
end