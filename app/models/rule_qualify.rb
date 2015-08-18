# == Schema Information
#
# Table name: rule_qualifies
#
#  id                 :integer          not null, primary key
#  challenge_id       :integer
#  exercise_unit_id   :integer
#  num_exercise_units :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class RuleQualify < ActiveRecord::Base
  # To count towards the total, each day must have at least X units.
  validates :challenge, presence: true
  validates :exercise_unit, presence: true
  validates :num_exercise_units, presence: true, numericality: {only_integer: true, greater_than: 0}
  
  
  belongs_to :challenge
  belongs_to :exercise_unit
end
