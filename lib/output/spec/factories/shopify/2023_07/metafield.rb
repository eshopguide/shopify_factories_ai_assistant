# frozen_string_literal: true

FactoryBot.define do
  factory :shopify_metafield, class: 'ShopifyAPI::Metafield' do
    key { FFaker::Lorem.word }
    namespace { FFaker::Lorem.word }
    value { FFaker::Lorem.sentence }
    created_at { FFaker::Time.datetime }
    description { FFaker::Lorem.sentence }
    id { FFaker::Random.rand(1..1000) }
    owner_id { FFaker::Random.rand(1..1000) }
    owner_resource { %w[product variant order customer].sample }
    type { %w[string integer float boolean].sample }
    updated_at { FFaker::Time.datetime }

    trait :with_article do
      article_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_blog do
      blog_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_collection do
      collection_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_customer do
      customer_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_draft_order do
      draft_order_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_order do
      order_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_page do
      page_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_product do
      product_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_product_image do
      product_image_id { FFaker::Random.rand(1..1000) }
    end

    trait :with_variant do
      variant_id { FFaker::Random.rand(1..1000) }
    end
  end
end