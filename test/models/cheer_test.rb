# == Schema Information
#
# Table name: cheers
#
#  id                :integer          not null, primary key
#  activity_id :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_cheers_on_user_id_and_activity_id  (user_id,activity_id) UNIQUE
#

require 'test_helper'

class CheerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
