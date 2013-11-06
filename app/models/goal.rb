class Goal < ActiveRecord::Base
  belongs_to :user
  attr_accessible :meta
end
