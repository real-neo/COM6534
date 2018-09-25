# == Schema Information
#
# Table name: consumables
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  description     :string
#  stock_level     :integer
#  min_stock_level :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category        :integer
#

FactoryBot.define do
  factory :consumable do
    name { "MyString" }
    description { "MyString" }
    stock_level { 500 }
    min_stock_level { 10 }
    category { :chemical }
  end
end
