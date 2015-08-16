# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  exercise_event_id :integer
#  user_id           :integer
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :user, presence: true
  validates :exercise_event, presence: true
  validates :content, presence: true
  
  belongs_to :user
  belongs_to :exercise_event
  
  
  def as_json(options={})
    super(options.merge(include: [:user, :exercise_event]))
  end
  
end
