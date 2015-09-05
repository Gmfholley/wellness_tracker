# == Schema Information
#
# Table name: cheers
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_cheers_on_user_id_and_activity_id  (user_id,activity_id) UNIQUE
#

class Cheer < ActiveRecord::Base
  validates :user, presence: true
  validates :activity, presence: true
  
  
  belongs_to :user
  belongs_to :activity
end
