# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_fulfillment, class: 'ShopifyAPI::Fulfillment' do
    created_at { FFaker::Time.datetime }
    id { FFaker::Random.rand(1..1000) }
    line_items { [{ item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) }] }
    location_id { FFaker::Random.rand(1..1000) }
    name { FFaker::Lorem.word }
    notify_customer { FFaker::Boolean.random }
    order_id { FFaker::Random.rand(1..1000) }
    origin_address { [{ address1: FFaker::Address.street_address, city: FFaker::Address.city, country: FFaker::Address.country }] }
    receipt { { status: %w[pending paid].sample, total: FFaker::Number.decimal } }
    service { FFaker::Lorem.word }
    shipment_status { %w[pending shipped delivered].sample }
    status { %w[open closed cancelled].sample }
    tracking_company { FFaker::Company.name }
    tracking_number { FFaker::Lorem.characters(10) }
    tracking_numbers { [FFaker::Lorem.characters(10), FFaker::Lorem.characters(10)] }
    tracking_url { FFaker::Internet.http_url }
    tracking_urls { [FFaker::Internet.http_url, FFaker::Internet.http_url] }
    updated_at { FFaker::Time.datetime }
    variant_inventory_management { FFaker::Lorem.word }

    trait :with_multiple_line_items do
      line_items { Array.new(3) { { item: FFaker::Product.product_name, quantity: FFaker::Random.rand(1..10) } } }
    end

    trait :with_multiple_tracking_numbers do
      tracking_numbers { Array.new(3) { FFaker::Lorem.characters(10) } }
    end

    trait :with_multiple_tracking_urls do
      tracking_urls { Array.new(3) { FFaker::Internet.http_url } }
    end

    trait :pending do
      shipment_status { 'pending' }
    end

    trait :shipped do
      shipment_status { 'shipped' }
    end

    trait :delivered do
      shipment_status { 'delivered' }
    end

    trait :open do
      status { 'open' }
    end

    trait :closed do
      status { 'closed' }
    end

    trait :cancelled do
      status { 'cancelled' }
    end
  end
end