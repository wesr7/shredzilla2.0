class History < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :program
end
