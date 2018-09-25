# == Schema Information
#
# Table name: purchases
#
#  id            :bigint(8)        not null, primary key
#  account_id    :bigint(8)
#  consumable_id :bigint(8)
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

class Purchase < ApplicationRecord
  belongs_to :account
  belongs_to :consumable

  validates :reason, presence: true
  validates :amount, presence: true, numericality: { integer_only: true, greater_than: 0 }
  validate do
    if amount.present?
      amount_available = consumable.number_available_for_purchase
      errors.add(:amount, "must be less than #{amount_available}") if amount > amount_available
    end
  end
end
