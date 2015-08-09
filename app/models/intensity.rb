# == Schema Information
#
# Table name: intensities
#
#  id               :integer          not null, primary key
#  name             :string
#  point_adjustment :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Intensity < ActiveRecord::Base
  validates :name, presence: true
  validates :point_adjustment, numericality: true, presence: true
  
  has_many :exercise_events
end
