# == Schema Information
#
# Table name: feature_toggles
#
#  id         :bigint(8)        not null, primary key
#  identifier :string
#  name       :string
#  enabled    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FeatureToggle < ApplicationRecord

  scope :enabled_features, -> { where(enabled: true) }

  def self.enabled_feature?(identifier)
    enabled_features.pluck(:identifier).include? identifier
  end

  def self.enabled_feature_identifiers
    enabled_features.pluck(:identifier)
  end

end
