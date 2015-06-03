# == Schema Information
#
# Table name: days
#
#  id          :integer          not null, primary key
#  program_id  :integer
#  day         :integer
#  description :string
#  option_1    :string
#  option_2    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Day < ActiveRecord::Base
  has_many :workouts
  has_many :exercises, through: :workouts
  belongs_to :program
  has_many :dailychallenges
end
