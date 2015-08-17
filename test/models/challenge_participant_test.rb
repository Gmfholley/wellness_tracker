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
# Indexes
#
#  index_challenge_participants_on_user_id_and_challenge_id  (user_id,challenge_id) UNIQUE
#

require 'test_helper'

class ChallengeParticipantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
