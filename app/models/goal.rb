class Goal < ActiveRecord::Base
  attr_accessible :name
  belongs_to :evaluation
end
