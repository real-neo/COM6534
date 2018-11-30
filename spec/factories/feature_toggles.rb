# == Schema Information
#
# Table name: feature_toggles
#
#  id         :integer          not null, primary key
#  identifier :string
#  name       :string
#  enabled    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :feature_toggle do

    factory :enable_purchasing do
      identifier { 'purchasing' }
      name { 'Students - Purchasing' }
      enabled { true }
    end

    factory :enable_reporting do
      identifier { 'reporting' }
      name { 'Staff - Reporting' }
      enabled { true }
    end

  end
end
