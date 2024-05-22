#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_assigned_fulfillment_order, class: 'ShopifyAPI::AssignedFulfillmentOrder' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    shop_id { FFaker::Random.rand(1..1000) }
    assigned_location_id { FFaker::Random.rand(1..1000) }
    status { ['open', 'closed', 'cancelled'].sample }
    request_status { ['unsubmitted', 'submitted', 'accepted'].sample }

    # Hash attributes
    destination { { address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }

    # Array attributes for line_items
    line_items { [{ item_id: FFaker::Random.rand(1..1000), quantity: FFaker::Random.rand(1..10) }] }

    # Traits
    trait :open do
      status { 'open' }
    end

    trait :closed do
      status { 'closed' }
    end

    trait :cancelled do
      status { 'cancelled' }
    end

    trait :unsubmitted do
      request_status { 'unsubmitted' }
    end

    trait :submitted do
      request_status { 'submitted' }
    end

    trait :accepted do
      request_status { 'accepted' }
    end
  end
end