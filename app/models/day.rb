class Day < ActiveRecord::Base
    has_many :workouts
    has_many :exercises, through: :workouts
end
