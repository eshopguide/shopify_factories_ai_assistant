#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_balance, class: 'ShopifyAPI::Balance' do
    # Array attributes for balance details
    balance { [{ currency: FFaker::Currency.code, amount: FFaker::Random.rand(1000..10000).to_s }] }
  end
end