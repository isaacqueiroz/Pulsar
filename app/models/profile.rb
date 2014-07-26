class Profile < ActiveRecord::Base
	attr_accessible :name, :sex, :surname, :address1, :address2, :phone, :birthdate, :signdate
  	belongs_to :user
end
