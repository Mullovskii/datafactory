class Website < ApplicationRecord
  belongs_to :country
  belongs_to :company, optional: true
  has_many :traffics
  has_many :countries, through: :traffics
end
