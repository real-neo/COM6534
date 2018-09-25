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

class Consumable < ApplicationRecord
  has_many :purchases

  CATEGORY_LIMITS = { stationary: 10, chemical: 1, hardware: 5, wearable: 20, disposable: 15 }
  enum category: CATEGORY_LIMITS.keys

  validates :name, :description, :stock_level, :min_stock_level, :category, presence: true
  validates :stock_level, :min_stock_level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def number_available_for_purchase
    [self.class::CATEGORY_LIMITS[self.category.to_sym], stock_level].min
  end

end
