# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  belongs_to :user
end
