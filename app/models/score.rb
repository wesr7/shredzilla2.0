class Score < ActiveRecord::Base
  belongs_to :history
  belongs_to :user
end
