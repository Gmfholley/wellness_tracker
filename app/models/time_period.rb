# == Schema Information
#
# Table name: time_periods
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TimePeriod < ActiveRecord::Base
end
