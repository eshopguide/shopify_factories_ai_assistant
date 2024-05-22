#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_policy, class: 'ShopifyAPI::Policy' do
    # Basic attributes
    title { "Return Policy" }
    body { FFaker::Lorem.paragraph }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    url { FFaker::Internet.http_url }
    handle { FFaker::Internet.slug }

    # Traits
    trait :privacy_policy do
      title { "Privacy Policy" }
      body { "Your privacy is important to us." }
    end

    trait :terms_of_service do
      title { "Terms of Service" }
      body { "These terms govern the use of our website and services." }
    end

    trait :refund_policy do
      title { "Refund Policy" }
      body { "If you are not satisfied with your purchase, you may return it for a refund." }
    end
  end
end