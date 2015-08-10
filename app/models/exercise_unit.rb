# == Schema Information
#
# Table name: exercise_units
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExerciseUnit < ActiveRecord::Base
  validates :name, presenece: true
end
