#frozen_string_literal: true

FactoryBot.define do
  factory :shopify_report, class: 'ShopifyAPI::Report' do
    # Basic attributes
    id { FFaker::Random.rand(1..1000) }
    name { "Sales Report" }
    category { "sales" }
    shopify_ql { "SHOW total_sales BY day FROM sales SINCE -1m UNTIL today ORDER BY total_sales" }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }

    # Traits
    trait :financial_report do
      name { "Financial Report" }
      category { "finance" }
      shopify_ql { "SHOW total_spent BY customer FROM order SINCE -1m UNTIL today ORDER BY total_spent DESC" }
    end

    trait :inventory_report do
      name { "Inventory Report" }
      category { "inventory" }
      shopify_ql { "SHOW product_title, variant_title, inventory_quantity FROM inventory_items" }
    end

    trait :customer_report do
      name { "Customer Report" }
      category { "customer" }
      shopify_ql { "SHOW customer_id, total_orders FROM customers SINCE -1y UNTIL today ORDER BY total_orders DESC" }
    end
  end
end