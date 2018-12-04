# == Schema Information
#
# Table name: mods
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mod < ApplicationRecord
  has_many :users
end
