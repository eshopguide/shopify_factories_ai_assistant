```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_order, class: 'ShopifyAPI::FulfillmentOrder' do
    assigned_location { { name: FFaker::Company.name, address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    assigned_location_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.datetime }
    delivery_method { { method: %w[standard express].sample, price: FFaker::Number.decimal } }
    destination { { address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country } }
    fulfill_at { FFaker::Time.datetime }
    fulfill_by { FFaker::Time.datetime }
    fulfillment_holds { [{ reason: FFaker::Lorem.sentence }] }
    id { FFaker::Random.rand(1..1000) }
    international_duties { { duty: FFaker::Number.decimal, tax: FFaker::Number.decimal } }
    line_items { build_list(:shopify_line_item, 3) }
    merchant_requests { [{ request: FFaker::Lorem.sentence }] }
    order_id { FFaker::Random.rand(1..1000) }
    request_status { %w[accepted rejected].sample }
    shop_id { FFaker::Random.rand(1..1000) }
    status { %w[open closed].sample }
    supported_actions { %w[hold release].sample(2) }
    updated_at { FFaker::Time.datetime }

    trait :accepted do
      request_status { 'accepted' }
    end

    trait :rejected do
      request_status { 'rejected' }
    end

    trait :open do
      status { 'open' }
    end

    trait :closed do
      status { 'closed' }
    end

    trait :with_fulfillment_holds do
      fulfillment_holds { [{ reason: FFaker::Lorem.sentence }] }
    end

    trait :with_merchant_requests do
      merchant_requests { [{ request: FFaker::Lorem.sentence }] }
    end
  end
end
```