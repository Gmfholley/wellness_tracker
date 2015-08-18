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

class Challenge < ActiveRecord::Base
  validates :name, presence: true
  validates :challenge_type, presence: true
  validates :start_date, presence: true, date: true
  validates :end_date, presence: true, date: true
  
  
  
  belongs_to :organization
  belongs_to :challenge_type
  
  
  has_many :rule_eaches, :inverse_of => :challenge  #This allows the validation of a challenge itself rather than an ID (for challenges that are being created at the same time as their rules)
  has_many :rule_qualifies, :inverse_of => :challenge
  has_many :rule_totals, :inverse_of => :challenge
  
  accepts_nested_attributes_for :rule_eaches, reject_if: :all_blank
  accepts_nested_attributes_for :rule_qualifies, reject_if: :all_blank
  accepts_nested_attributes_for :rule_totals, reject_if: :all_blank
  
  has_many :challenge_participants
  has_many :users, through: :challenge_participants
  has_many :teams, through: :challenge_participants
    
  before_create :generate_token


  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless ModelName.exists?(token: random_token)
    end
  end
end
