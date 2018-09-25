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

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
