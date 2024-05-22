#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_blog, class: 'ShopifyAPI::Blog' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    title { FFaker::Lorem.sentence }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
    handle { FFaker::Internet.slug }
    commentable { ['no', 'moderate', 'yes'].sample }
    feedburner { FFaker::Internet.http_url }
    feedburner_location { FFaker::Internet.domain_name }
    tags { FFaker::Lorem.words(number: 4).join(', ') }
    template_suffix { FFaker::Lorem.word }

    # Array attributes for metafields
    metafields { [{ namespace: 'global', key: 'description', value: FFaker::Lorem.sentence, value_type: 'string' }] }

    # Traits
    trait :commentable_no do
      commentable { 'no' }
    end

    trait :commentable_moderate do
      commentable { 'moderate' }
    end

    trait :commentable_yes do
      commentable { 'yes' }
    end
  end
end