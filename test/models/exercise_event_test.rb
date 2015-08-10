# == Schema Information
#
# Table name: exercise_events
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  exercise_type_id :integer
#  intensity_id     :integer
#  date             :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  num_units        :float
#  exercise_unit_id :integer
#

require 'test_helper'

class ExerciseEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
