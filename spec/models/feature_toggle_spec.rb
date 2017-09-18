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

require 'rails_helper'

RSpec.describe FeatureToggle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
