```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_deprecated_api_call, class: 'ShopifyAPI::DeprecatedApiCall' do
    data_updated_at { FFaker::Time.datetime }
    deprecated_api_calls { Array.new(3) { { endpoint: FFaker::Internet.http_url, reason: FFaker::Lorem.sentence } } }

    trait :with_multiple_calls do
      deprecated_api_calls { Array.new(5) { { endpoint: FFaker::Internet.http_url, reason: FFaker::Lorem.sentence } } }
    end
  end
end
```