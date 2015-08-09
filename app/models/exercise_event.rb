# == Schema Information
#
# Table name: exercise_events
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  exercise_type_id :integer
#  duration         :integer
#  intensity_id     :integer
#  points           :integer
#  date             :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ExerciseEvent < ActiveRecord::Base
end