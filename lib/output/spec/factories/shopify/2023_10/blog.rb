# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_blog, class: 'ShopifyAPI::Blog' do
    admin_graphql_api_id { FFaker::Lorem.characters(10) }
    commentable { %w[no yes].sample }
    created_at { FFaker::Time.datetime }
    feedburner { FFaker::Internet.http_url }
    feedburner_location { FFaker::Internet.http_url }
    handle { FFaker::Internet.slug }
    tags { FFaker::Lorem.words.join(', ') }
    template_suffix { FFaker::Lorem.word }
    title { FFaker::Lorem.sentence }
    updated_at { FFaker::Time.datetime }

    association :metafields, factory: :shopify_metafield

    trait :commentable do
      commentable { 'yes' }
    end

    trait :non_commentable do
      commentable { 'no' }
    end

    trait :with_feedburner do
      feedburner { FFaker::Internet.http_url }
      feedburner_location { FFaker::Internet.http_url }
    end

    trait :without_feedburner do
      feedburner { nil }
      feedburner_location { nil }
    end
  end
end