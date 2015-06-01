# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  program_id   :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Team < ActiveRecord::Base
  belongs_to :program
  has_many :users, through: :memberships
end
