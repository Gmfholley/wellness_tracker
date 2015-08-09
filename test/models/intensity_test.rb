# == Schema Information
#
# Table name: intensities
#
#  id               :integer          not null, primary key
#  name             :string
#  point_adjustment :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class IntensityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
