# encoding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
	attr_accessible :username, :email
	validates_presence_of :username, message: "Digite um nome de usuário válido"
	validates_presence_of :email, message: "Digite um email válido"

	has_one :profile
	has_many :evaluations
  has_many :postural_assessments
  has_many :goals
  has_many :exams
end
