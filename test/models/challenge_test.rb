# == Schema Information
#
# Table name: challenges
#
#  id                :integer          not null, primary key
#  name              :string
#  challenge_type_id :integer
#  num_type          :integer
#  num_in_type       :integer
#  start_date        :datetime
#  end_date          :datetime
#  organization_id   :integer
#  description       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  token             :string
#
# Indexes
#
#  index_challenges_on_token  (token) UNIQUE
#

require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
