# == Schema Information
#
# Table name: challenge_participants
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  user_id      :integer
#  team_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ChallengeParticipant < ActiveRecord::Base
  validates :challenge, presence: true
  validates :team, presence: true

  belongs_to :challenge
  belongs_to :user
  belongs_to :team
end
