class PosturalAssessment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :artrose, :cifose, :escoliose, :hernia, :image1, :image2, :image3, :lordose, :obs
  mount_uploader :image1, Image1Uploader
  mount_uploader :image2, Image2Uploader
  mount_uploader :image3, Image3Uploader

end
