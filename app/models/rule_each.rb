# == Schema Information
#
# Table name: rule_eaches
#
#  id                 :integer          not null, primary key
#  challenge_id       :integer
#  exercise_unit_id   :integer
#  num_exercise_units :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class RuleEach < ActiveRecord::Base
end
