# == Schema Information
#
# Table name: scores
#
#  id           :integer          not null, primary key
#  history_id   :integer
#  user_id      :integer
#  day          :integer
#  food         :integer
#  workout      :integer
#  sleep        :integer
#  challenge    :integer
#  daily_update :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Score < ActiveRecord::Base
  belongs_to :history
  belongs_to :user
end
