class Country < ApplicationRecord
	has_many :traffics
  	has_many :websites, through: :traffics
end
