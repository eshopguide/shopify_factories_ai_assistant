#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_redirect, class: 'ShopifyAPI::Redirect' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    path { "/old-path" }
    target { "/new-path" }

    # Traits
    trait :with_custom_path do
      path { "/custom-old-path" }
      target { "/custom-new-path" }
    end
  end
end