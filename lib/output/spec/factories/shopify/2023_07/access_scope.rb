# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_access_scope, class: 'ShopifyAPI::AccessScope' do
    handle { FFaker::Lorem.word }
    access_scopes { [{ scope: FFaker::Lorem.word }, { scope: FFaker::Lorem.word }] }

    trait :with_multiple_scopes do
      access_scopes { Array.new(5) { { scope: FFaker::Lorem.word } } }
    end
  end
end