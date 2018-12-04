# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  mod_id             :string
#  admin              :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           default(""), not null
#  sign_in_count      :integer          default(0), not null
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string
#  last_sign_in_ip    :string
#  username           :string
#  uid                :string
#  mail               :string
#  ou                 :string
#  dn                 :string
#  sn                 :string
#  givenname          :string
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_mod_id    (mod_id)
#  index_users_on_username  (username)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
