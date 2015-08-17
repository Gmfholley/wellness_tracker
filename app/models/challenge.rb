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
#  corporation_id    :integer
#  description       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Challenge < ActiveRecord::Base
  belongs_to :organization
  belongs_to :challenge_type
  
end
