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
#

class Challenge < ActiveRecord::Base
  validates :name, presence: true
  validates :challenge_type, presence: true
  validates :start_date, presence: true, date: true
  validates :end_date, presence: true, date: true
  
  
  
  belongs_to :organization
  belongs_to :challenge_type
  
  
  has_many :rule_eaches
  has_many :rule_qualifies
  has_many :rule_totals
  
  accepts_nested_attributes_for :rule_eaches
  accepts_nested_attributes_for :rule_qualifies
  accepts_nested_attributes_for :rule_totals
  
  has_many :challenge_participants
  has_many :users, through: :challenge_participants
  has_many :teams, through: :challenge_participants
  
end
