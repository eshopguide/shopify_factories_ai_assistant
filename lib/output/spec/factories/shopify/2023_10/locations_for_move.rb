```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_locations_for_move, class: 'ShopifyAPI::LocationsForMove' do
    locations_for_move { build_list(:shopify_location, 3) }

    trait :with_multiple_locations do
      locations_for_move { build_list(:shopify_location, 5) }
    end

    trait :with_single_location do
      locations_for_move { build_list(:shopify_location, 1) }
    end
  end
end
```