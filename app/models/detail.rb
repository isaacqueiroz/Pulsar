class Detail < ActiveRecord::Base
  attr_accessible :area, :description, :title
  belongs_to :evaluation
end
