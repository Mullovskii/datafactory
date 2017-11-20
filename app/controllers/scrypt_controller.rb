class ScryptController < ApplicationController

	def indonesia
		# UPDATE TRAFFICS
		Traffic.all.each do |traffic|
			if traffic.website.monthly_visits
				traffic.update(country_visits: (traffic.country_share*traffic.website.monthly_visits))
				setup = traffic.website.setup
				traffic.update(annual_turnover: (traffic.country_visits*setup.conversion*setup.average_bill) )
			end
		end
	end

end
