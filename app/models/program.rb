# == Schema Information
#
# Table name: programs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Program < ActiveRecord::Base
  has_many :days
  has_many :teams
end
