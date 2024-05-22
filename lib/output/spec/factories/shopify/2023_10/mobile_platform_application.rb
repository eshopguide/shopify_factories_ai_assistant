```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_mobile_platform_application, class: 'ShopifyAPI::MobilePlatformApplication' do
    application_id { FFaker::Lorem.characters(10) }
    enabled_shared_webcredentials { FFaker::Boolean.random }
    enabled_universal_or_app_links { FFaker::Boolean.random }
    id { FFaker::Random.rand(1..1000) }
    platform { %w[iOS Android].sample }
    sha256_cert_fingerprints { [FFaker::Lorem.characters(64), FFaker::Lorem.characters(64)] }

    trait :ios do
      platform { 'iOS' }
    end

    trait :android do
      platform { 'Android' }
    end

    trait :with_shared_webcredentials do
      enabled_shared_webcredentials { true }
    end

    trait :without_shared_webcredentials do
      enabled_shared_webcredentials { false }
    end

    trait :with_universal_or_app_links do
      enabled_universal_or_app_links { true }
    end

    trait :without_universal_or_app_links do
      enabled_universal_or_app_links { false }
    end
  end
end
```