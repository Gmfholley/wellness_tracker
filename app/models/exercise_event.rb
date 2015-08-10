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

class ExerciseEvent < ActiveRecord::Base
  validates :user, presence: true
  validates :date, presence: true, date: true
  validates :exercise_type, presence: true
  validates :intensity, presence: true
  validates :exercise_unit, presence: true
  validates :num_units, presence: true, numericality: {greater_than: 0}
  
  has_many :comments
  has_many :cheers
  
  
  belongs_to :exercise_type
  belongs_to :intensity
  belongs_to :user
  belongs_to :exercise_unit
end
