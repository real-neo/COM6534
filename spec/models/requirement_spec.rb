# == Schema Information
#
# Table name: requirements
#
#  id              :integer          not null, primary key
#  company_name    :string
#  email           :string
#  project_name    :string
#  project_details :string
#  budget          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  state           :string           default("waiting")
#

require 'rails_helper'

RSpec.describe Requirement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
