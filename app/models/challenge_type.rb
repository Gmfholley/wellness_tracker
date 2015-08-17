# == Schema Information
#
# Table name: challenge_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChallengeType < ActiveRecord::Base
  validates :name, presence: true
end
