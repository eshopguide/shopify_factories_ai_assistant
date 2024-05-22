#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_deprecated_api_call, class: 'ShopifyAPI::DeprecatedApiCall' do
    # Basic attributes
    data_updated_at { FFaker::Time.date }

    # Array attributes for deprecated api calls
    deprecated_api_calls { [{ endpoint: 'products/<product_id>.json', method: 'GET', message: 'Endpoint deprecated', deprecated_on: FFaker::Time.date }] }
  end
end