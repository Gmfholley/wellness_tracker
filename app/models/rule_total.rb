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

class RuleTotal < ActiveRecord::Base
  # The goal is X Units in Y Period.
  validates :challenge, presence: true
  validates :exercise_unit, presence: true
  validates :time_period, presence: true
  validates :num_time_periods, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :num_exercise_units, presence: true, numericality: {only_integer: true, greater_than: 0}
  
  belongs_to :challenge
  belongs_to :exercise_unit
  belongs_to :time_period
  
end
