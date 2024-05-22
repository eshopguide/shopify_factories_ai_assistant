#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_locations_for_move, class: 'ShopifyAPI::LocationsForMove' do
    # Array attributes
    locations_for_move { build_list(:shopify_location, 3) }
  end
end