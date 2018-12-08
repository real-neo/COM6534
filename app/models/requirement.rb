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
#  state           :string           default("Waiting")
#  username        :string
#

class Requirement < ApplicationRecord
  validates :company_name, presence: true
  validates :company_name, presence: true
  validates :email, presence: true
  validates :project_name, presence: true
  validates :project_details, presence: true
  validates :budget, presence: true
end
