class Workout < ActiveRecord::Base
  belongs_to :day
  belongs_to :exercise
end
