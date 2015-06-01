# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  name       :string
#  video      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exercise < ActiveRecord::Base
  belongs_to :workouts
end
