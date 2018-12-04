# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  username   :string
#  project_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Record < ApplicationRecord
end
