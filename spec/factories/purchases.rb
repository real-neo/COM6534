# == Schema Information
#
# Table name: purchases
#
#  id            :integer          not null, primary key
#  account_id    :integer
#  consumable_id :integer
#  amount        :integer
#  reason        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_purchases_on_account_id     (account_id)
#  index_purchases_on_consumable_id  (consumable_id)
#

FactoryGirl.define do
  factory :purchase do
    account ""
    amount 1
    reason "MyText"
  end
end
