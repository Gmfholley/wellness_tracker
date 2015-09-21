# == Schema Information
#
# Table name: activities
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

class Activity < ActiveRecord::Base
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
  
  def user_has_commented?(user)
    !self.comments.where(user_id: user.id).empty?
  end
    
  def user_has_cheered?(user)
    !self.cheers.where(user_id: user.id).empty?
  end
  
  def cheerers
    cheersArr = self.cheers.includes(:user)
    cheerersArr = []
    cheersArr.each do |cheer|
      cheerersArr.push("#{cheer.user.first_name} #{cheer.user.last_name}")
    end
    cheerersArr
  end
  
end
