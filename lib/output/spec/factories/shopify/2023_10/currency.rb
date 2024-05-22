```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_currency, class: 'ShopifyAPI::Currency' do
    currency { FFaker::Currency.code }
    rate_updated_at { FFaker::Time.datetime }

    trait :recent_rate_update do
      rate_updated_at { FFaker::Time.datetime }
    end

    trait :old_rate_update do
      rate_updated_at { FFaker::Time.datetime - 1.year }
    end
  end
end
```