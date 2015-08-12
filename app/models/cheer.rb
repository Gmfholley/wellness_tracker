# == Schema Information
#
# Table name: cheers
#
#  id                :integer          not null, primary key
#  exercise_event_id :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_cheers_on_user_id_and_exercise_event_id  (user_id,exercise_event_id) UNIQUE
#

class Cheer < ActiveRecord::Base
  validates :user, presence: true
  validates :exercise_event, presence: true
  
  
  belongs_to :user
  belongs_to :exercise_event
end
