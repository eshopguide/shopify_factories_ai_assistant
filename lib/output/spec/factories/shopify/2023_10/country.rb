```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_country, class: 'ShopifyAPI::Country' do
    code { FFaker::Address.country_code }
    id { FFaker::Random.rand(1..1000) }
    name { FFaker::Address.country }
    tax { FFaker::Number.decimal }

    trait :with_provinces do
      provinces { build_list(:shopify_province, 3) }
    end
  end
end
```