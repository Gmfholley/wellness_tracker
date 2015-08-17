# == Schema Information
#
# Table name: rule_totals
#
#  id                 :integer          not null, primary key
#  challenge_id       :integer
#  exercise_unit_id   :integer
#  num_exercise_units :integer
#  time_period_id     :integer
#  num_time_periods   :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class RuleTotalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
