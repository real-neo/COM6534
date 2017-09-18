# == Schema Information
#
# Table name: consumables
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :string
#  stock_level     :integer
#  min_stock_level :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category        :integer
#

require 'rails_helper'

RSpec.describe Consumable, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
