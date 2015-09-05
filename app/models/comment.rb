# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  user_id     :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :user, presence: true
  validates :activity, presence: true
  validates :content, presence: true
  
  belongs_to :user
  belongs_to :activity
  
end
