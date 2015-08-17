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
  validates :challenge, presence: true
  validates :exercise_unit, presence: true
  validates :num_exercise_units, presence: true, numericality: {only_integer: true, greater_than: 0}
  
  
  belongs_to :challenge
  belongs_to :exercise_unit
end
