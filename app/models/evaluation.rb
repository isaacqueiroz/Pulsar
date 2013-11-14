class Evaluation < ActiveRecord::Base
  attr_accessible :mabdomen, :mcintura, :mcoxa, :mmagraa, :mmagrap, :mquadril, :mtorax, :peso, :pgordura, :sexo, :tacademia, :tflex, :details_attributes, :dataeval, :altura, :mgordura, :pgordurai, :pesodes, :imc, :metbasal, :mantbracod, :mantbracoe, :mbracod, :mbracoe, :mcoxad, :mcoxae, :mpantd, :mpante, :mbicepsd, :mbicepse, :goals_attributes
  belongs_to :user
  has_many :details
  accepts_nested_attributes_for :details, allow_destroy: true

  has_many :goals
  accepts_nested_attributes_for :goals, allow_destroy: true
end
