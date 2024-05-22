```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_redirect, class: 'ShopifyAPI::Redirect' do
    id { FFaker::Random.rand(1..1000) }
    path { FFaker::Internet.http_url }
    target { FFaker::Internet.http_url }

    trait :with_custom_path do
      path { "/custom/#{FFaker::Lorem.word}" }
    end

    trait :with_custom_target do
      target { "/target/#{FFaker::Lorem.word}" }
    end
  end
end
```