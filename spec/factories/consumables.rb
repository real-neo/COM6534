FactoryGirl.define do
  factory :consumable do
    name "MyString"
    description "MyString"
    stock_level 500
    min_stock_level 10
    category :chemical
  end
end
