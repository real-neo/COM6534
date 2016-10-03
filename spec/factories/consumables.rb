FactoryGirl.define do
  factory :consumable do
    name "MyString"
    description "MyString"
    stock_level 1
    min_stock_level 1
    category :chemical
  end
end
