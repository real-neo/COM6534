# == Schema Information
#
# Table name: accounts
#
#  id                 :bigint(8)        not null, primary key
#  email              :string           default(""), not null
#  sign_in_count      :integer          default(0), not null
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string
#  last_sign_in_ip    :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  username           :string
#  uid                :string
#  mail               :string
#  ou                 :string
#  dn                 :string
#  sn                 :string
#  givenname          :string
#  role               :integer
#
# Indexes
#
#  index_accounts_on_email     (email)
#  index_accounts_on_username  (username)
#

class Account < ApplicationRecord
  include EpiCas::DeviseHelper

  enum role: [ :student, :staff ]
  has_many :purchases

  def generate_attributes_from_ldap_info
    if self.dn.downcase =~ /students/
      self.role ||= :student
    elsif self.dn.downcase =~ /staff/
      self.role ||= :staff
    end
    super
  end
end
