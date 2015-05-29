# == Schema Information
#
# Table name: challenges
#
#  id          :integer          not null, primary key
#  name        :string
#  start_date  :date
#  current_day :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Challenge < ActiveRecord::Base
  has_and_belongs_to_many :programs
  has_many :teams
end
