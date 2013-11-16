class Detail < ActiveRecord::Base
  attr_accessible :area, :description, :title, :cronico, :tipo
  belongs_to :evaluation
end
