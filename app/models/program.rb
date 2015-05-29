class Program < ActiveRecord::Base
  has_many :days
  has_many :teams
end
