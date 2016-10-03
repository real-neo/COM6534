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

class Consumable < ApplicationRecord
  enum category: [ :stationary, :chemical, :hardware, :wearable, :disposable ]

  validates :name, :description, :stock_level, :min_stock_level, presence: true
  validates :stock_level, :min_stock_level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
