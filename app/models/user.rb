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
  
  has_many :exercise_events
  has_many :exercise_types, through: :exercise_events
  
  has_and_belongs_to_many :friends, :class_name => "User",
                                      :foreign_key => "user_id",
                                      :association_foreign_key => "friend_id"
  
  
  
  
  # returns an Array of Users that are not my friends
  #
  # returns an Array of Users
  def not_friends
    #TODO - get a better implementation of this
    not_me = User.all.includes(:friends).where.not(id: self.id).limit(50)
    not_my_friends = not_me.select{|user| !user.friends.exists?(self.id)}
    not_my_friends
  end
  # returns the total points from all this person's exercise events
  #
  # returns an Integer
  def total_points
    ExerciseEvent.points_for_person(id)
  end
  
  # returns the total points from all this person's exercise events between the start and end dates
  #
  # date_start - Date to start  (I believe SQL treats dates as a straight Integer)
  # date_end   - Date to end (again, SQL treats as an Integer)  
  #
  # returns an Integer
  def points(date_start, date_end)
    ExerciseEvent.points_for_person_within_dates(id, date_start, date_end)
  end
end
