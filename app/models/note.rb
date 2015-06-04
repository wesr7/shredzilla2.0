class Note < ActiveRecord::Base
  belongs_to :day
  belongs_to :workout
end
