class Team < ActiveRecord::Base
  belongs_to :program
  has_many :users, through: :members
end
