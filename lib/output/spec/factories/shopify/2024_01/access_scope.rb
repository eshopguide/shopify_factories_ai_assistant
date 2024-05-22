#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_access_scope, class: 'ShopifyAPI::AccessScope' do
    # Basic attributes
    handle { FFaker::Internet.user_name }

    # Array attributes
    access_scopes { [{ scope: 'read_products', description: 'Read access to products' }, { scope: 'write_products', description: 'Write access to products' }] }

    # Traits
    trait :read_only do
      access_scopes { [{ scope: 'read_products', description: 'Read access to products' }] }
    end

    trait :write_only do
      access_scopes { [{ scope: 'write_products', description: 'Write access to products' }] }
    end

    trait :full_access do
      access_scopes { [{ scope: 'read_products', description: 'Read access to products' }, { scope: 'write_products', description: 'Write access to products' }] }
    end
  end
end