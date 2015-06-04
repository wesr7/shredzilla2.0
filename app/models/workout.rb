# == Schema Information
#
# Table name: workouts
#
#  id          :integer          not null, primary key
#  day_id      :integer
#  exercise_id :integer
#  hold        :string
#  reps        :string
#  sets        :string
#  timer       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Workout < ActiveRecord::Base
  belongs_to :day
  belongs_to :exercise
  belongs_to :note
end
