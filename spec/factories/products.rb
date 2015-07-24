FactoryGirl.define do
  factory :product do
    # t.string   title Faker::Name.first_name
    # association :user, factory: :user
    sequence(:title)     { |n| "Product Title #{n}"}
    sequence(:description)  { |n| "Product Descriptions #{n}" }
    price              100
    # sequence(:sku)     { |n| "Price #{n}"}
    # # t.string   description Faker::Name.last_name
    # # t.float    price 100.0
    # t.string   sku  3968656
    # t.integer  quantity 1
    # t.integer  category_id 1
    # t.integer  producer_id 1
  end
end
