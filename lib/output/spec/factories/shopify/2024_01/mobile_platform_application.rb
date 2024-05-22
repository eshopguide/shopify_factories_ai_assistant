#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_mobile_platform_application, class: 'ShopifyAPI::MobilePlatformApplication' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    application_id { FFaker::Lorem.characters(10) }
    platform { ['iOS', 'Android'].sample }
    enabled_shared_webcredentials { FFaker::Boolean.random }
    enabled_universal_or_app_links { FFaker::Boolean.random }
    sha256_cert_fingerprints { Array.new(3) { FFaker::Internet.password(min_length: 64, max_length: 64) } }

    # Traits
    trait :with_ios_platform do
      platform { 'iOS' }
    end

    trait :with_android_platform do
      platform { 'Android' }
    end

    trait :with_webcredentials_enabled do
      enabled_shared_webcredentials { true }
    end

    trait :with_webcredentials_disabled do
      enabled_shared_webcredentials { false }
    end

    trait :with_app_links_enabled do
      enabled_universal_or_app_links { true }
    end

    trait :with_app_links_disabled do
      enabled_universal_or_app_links { false }
    end
  end
end