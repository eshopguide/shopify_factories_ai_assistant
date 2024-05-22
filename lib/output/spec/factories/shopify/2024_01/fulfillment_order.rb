#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment_order, class: 'ShopifyAPI::FulfillmentOrder' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    order_id { FFaker::Random.rand(1..1000) }
    shop_id { FFaker::Random.rand(1..1000) }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    status { ['open', 'closed', 'cancelled', 'in_progress', 'on_hold'].sample }
    fulfill_at { FFaker::Time.date }
    fulfill_by { FFaker::Time.date }

    # Hash attributes
    assigned_location { { name: FFaker::Company.name, address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    destination { { address1: FFaker::Address.street_address, city: FFaker::Address.city, zip: FFaker::Address.zip_code, country: FFaker::Address.country } }
    delivery_method { { method_type: 'pickup', service_name: 'In-store Pickup' } }
    international_duties { { duties_paid: true, currency: FFaker::Currency.code, total_price: FFaker::Random.rand(10..100).to_s } }

    # Array attributes
    line_items { [{ title: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10), price: FFaker::Random.rand(10..100).to_s }] }
    fulfillment_holds { [{ reason: 'inventory_not_available', hold_placed_at: FFaker::Time.date }] }
    merchant_requests { [{ message: 'Expedite this order', created_at: FFaker::Time.date }] }
    supported_actions { ['cancel', 'close', 'open'] }

    # Traits
    trait :with_high_priority do
      merchant_requests { [{ message: 'High priority order', created_at: FFaker::Time.date }] }
    end

    trait :with_custom_delivery do
      delivery_method { { method_type: 'custom', service_name: 'Drone Delivery' } }
    end
  end
end