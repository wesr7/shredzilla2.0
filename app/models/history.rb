# == Schema Information
#
# Table name: histories
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  program_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class History < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :program
end
