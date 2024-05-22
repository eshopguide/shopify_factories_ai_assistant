```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_policy, class: 'ShopifyAPI::Policy' do
    body { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.datetime }
    handle { FFaker::Lorem.word }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }
    url { FFaker::Internet.http_url }

    trait :with_title do
      title { FFaker::Lorem.sentence }
    end

    trait :with_url do
      url { FFaker::Internet.http_url }
    end
  end
end
```