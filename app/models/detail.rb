class Detail < ActiveRecord::Base
  attr_accessible :area, :description, :title
  validates :area, :description, :presence => true
  belongs_to :evaluation
end
