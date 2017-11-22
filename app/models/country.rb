class Country < ApplicationRecord
	has_many :traffics
  	has_many :websites, through: :traffics
  	has_many :habbits
  	# has_many :local_websites, through: :traffics, :class_name => "Website", :foreign_key => "mother_country_id"
  	# has_many :local_websites, :class_name => "Website", :foreign_key => "mother_country_id"

end
