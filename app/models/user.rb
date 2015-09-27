# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  first_name                      :string
#  last_name                       :string
#  profile_picture                 :string
#  username                        :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_remember_me_token     (remember_me_token)
#  index_users_on_reset_password_token  (reset_password_token)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password_confirmation, presence: true
  validates :password, confirmation: true, length: {minimum: 5}
  validates :email, presence: true, email: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  
  has_many :activities
  has_many :exercise_types, through: :activities
  has_many :challenge_participants
  has_many :challenges, through: :challenge_participants
  has_many :teams, through: :challenge_participants
  has_many :organizations
  
  has_many :comments
  has_many :cheers
  
  has_and_belongs_to_many :friends, :class_name => "User",
                                    :foreign_key => "user_id",
                                    :association_foreign_key => "friend_id"

                                    
  
  
  # returns an Array of Users that are not my friends
  #
  # returns an Array of Users
  def not_friends
    #TODO - get a better implementation of this
    not_me = User.all.includes(:friends).where.not(id: self.id).limit(50)
    not_my_friends = not_me.select{|user| !self.friends.exists?(user.id)}
    not_my_friends
  end
  
  #TODO - is there a better way to write this?
  #TODO - use will_paginate to get the right number
  # returns friends activities in date order
  #
  # returns an Array of Activity objects
  def friends_activities
    Activity.includes(:user, :intensity, :exercise_unit, :exercise_type).includes(:comments => [:user]).includes(:cheers => [:user]).where(:user_id => [self.friends.ids]).order(date: :desc)
  end
  
  # returns the total points from all this person's exercise events
  #
  # returns an Integer
  def total_points
    Activity.points_for_person(id)
  end
  
  # returns the total points from all this person's exercise events between the start and end dates
  #
  # date_start - Date to start  (I believe SQL treats dates as a straight Integer)
  # date_end   - Date to end (again, SQL treats as an Integer)  
  #
  # returns an Integer
  def points(date_start, date_end)
    Activity.points_for_person_within_dates(id, date_start, date_end)
  end
end
