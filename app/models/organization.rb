# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Organization < ActiveRecord::Base
  validates :user, presence: true
  validates :name, presence: true
  
  belongs_to :user
  
  has_many :challenges
end
