# == Schema Information
#
# Table name: rule_qualifies
#
#  id                 :integer          not null, primary key
#  challenge_id       :integer
#  time_period_id     :integer
#  exercise_unit_id   :integer
#  num_exercise_units :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class RuleQualify < ActiveRecord::Base
  validates :challenge, presence: true
  validates :time_period, presence: true
  validates :exercise_unit, presence: true
  validates :num_exercise_units, presence: true, numericality: {only_integer: true, greater_than: 0}

  belongs_to :challenge
  belongs_to :time_period
  belongs_to :exercise_unit
  
end