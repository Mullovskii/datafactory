
# setting = Setting.create!(average_bill: 30, yandex_net_fee: 0.008, yandex_share: 0.10, conversion: 0.03)
# Country.create!(name: "Japan", sales_region: true)

# # SEED WEBSITES INDONESIA
# 	file = File.join(Rails.root, 'app', 'files', 'Indonesia', 'TopSites-(Shopping)--(360)--(Month-2017-10-1).xlsx')
#     xlsx = Roo::Spreadsheet.open(file)
#     xlsx = Roo::Excelx.new(file)
#     xlsx.sheet(1).column(1).each do |website|
#     	unless website == 'Domain'
#     		Website.create!(url: website, category: 0, status: 1, country_id: Country.where(name: "Indonesia").take.id)
#     	end
#     end


# # SEED TRAFFICS INDONESIA
#  	Website.all.each do |site|
# 		file = File.join(Rails.root, 'app', 'files', 'Indonesia', "GeographyExtended-(#{site.url})--(999)--(Month_2017_10_1).xlsx")
# 	    xlsx = Roo::Spreadsheet.open(file)
# 	    xlsx = Roo::Excelx.new(file)
# 	   	Website.where(url: site.url).take.update(monthly_visits: xlsx.sheet(1).cell(1,'J'))
# 	   	website = Website.where(url: site.url).take

# 	    hash = xlsx.sheet(1).each(country: 'Country', share: 'Traffic share') do |hash|
# 	    	unless Country.where(name: hash[:country]).take || hash[:country] == 'Country'
# 	    		Country.create!(name: hash[:country])
# 	    	end	    
# 	    	unless Traffic.where(website_id: website.id, country_id: Country.where(name: hash[:country]).take).take 
# 	    		unless hash[:country] == 'Country' || website.url == 'Domain' 
# 	    			traffic = Traffic.create!(mother_country_id: website.country.id, website_id: website.id, country_id: Country.where(name: hash[:country]).take.id, country_share: hash[:share])
# 	    			traffic.update!(country_visits: (traffic.country_share*website.monthly_visits*12), annual_turnover: (traffic.country_share*website.monthly_visits*setting.average_bill*setting.conversion*12))	
# 	    		end
# 	    	end
# 	    end
#  	end


# Inflow.destroy_all

# # UPGRADE TRAFFIC

# 	Traffic.all.each do |traffic|
# 		unless traffic.mother_country_id == traffic.website.country_id
# 			traffic.update!(mother_country_id: traffic.website.country_id)
# 		end
# 	end




# SEED WEBSITES
	# file = File.join(Rails.root, 'app', 'files', 'taiwan', 'TopSites-(Shopping)--(158)--(Month_2017_10_1).xlsx') #change 
 #    xlsx = Roo::Spreadsheet.open(file)
 #    xlsx = Roo::Excelx.new(file)
 #    xlsx.sheet(1).column(1).each do |site|
 #    	unless site == 'Domain' || Website.where(url: site.downcase).take
 #    		#change 
 #    		Website.create!(url: site.downcase, valid_for_yandex: true, category: 0, status: 1, country_id: Country.where(name: "Taiwan").take.id)
 #    		#change 
 #    		if File.join(Rails.root, 'app', 'files', 'taiwan', "GeographyExtended-(#{site.downcase})--(999)--(Month_2017_10_1).xlsx")
 #    			#change 
 #    			file = File.join(Rails.root, 'app', 'files', 'taiwan', "GeographyExtended-(#{site.downcase})--(999)--(Month_2017_10_1).xlsx")
 #    			p file
 #    			unless file == ''
	# 			    xlsx = Roo::Spreadsheet.open(file)
	# 			    xlsx = Roo::Excelx.new(file)
	# 			   	Website.where(url: site.downcase).take.update(monthly_visits: xlsx.sheet(1).cell(1,'J'))
	# 			   	website = Website.where(url: site.downcase).take
	# 			    hash = xlsx.sheet(1).each(country: 'Country', share: 'Traffic share') do |hash|
	# 			    	unless Country.where(name: hash[:country]).take || hash[:country] == 'Country'
	# 			    		Country.create!(name: hash[:country])
	# 			    	end	    
	# 			    	unless Traffic.where(website_id: website.id, country_id: Country.where(name: hash[:country]).take).take 
	# 			    		unless hash[:country] == 'Country' || website.url == 'Domain' 
	# 			    			traffic = Traffic.create!(mother_country_id: website.country.id, website_id: website.id, country_id: Country.where(name: hash[:country]).take.id, country_share: hash[:share])
	# 			    			traffic.update!(country_visits: (traffic.country_share*website.monthly_visits*12), annual_turnover: (traffic.country_share*website.monthly_visits*Setting.last.average_bill*Setting.last.conversion*12))	
	# 			    		end
	# 			    	end
	# 			    end
	# 			end
 #    		end    		
 #    	end
 #    end


	

# SEED INFLOWS


mother_country = Country.where(name: "Taiwan").take
Inflow.where(exporter_country_id: mother_country.id).destroy_all
Traffic.where(mother_country_id: mother_country.id).each do |traffic|
	if traffic.website.valid_for_yandex
		if inflow = Inflow.where(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id).take
			inflow.update!(annual_turnover: inflow.annual_turnover + traffic.annual_turnover)
		else
			Inflow.create!(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id, annual_turnover: traffic.annual_turnover)
		end
	end
end

# mother_country = Country.where(name: "Indonesia").take
# Inflow.where(exporter_country_id: mother_country.id).destroy_all
# Traffic.where(mother_country_id: mother_country.id).each do |traffic|
# 	if traffic.website.valid_for_yandex
# 		if inflow = Inflow.where(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id).take
# 			inflow.update!(annual_turnover: inflow.annual_turnover + traffic.annual_turnover)
# 		else
# 			Inflow.create!(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id, annual_turnover: traffic.annual_turnover)
# 		end
# 	end
# end

# mother_country = Country.where(name: "Hong Kong").take
# Inflow.where(exporter_country_id: mother_country.id).destroy_all
# Traffic.where(mother_country_id: mother_country.id).each do |traffic|
# 	if traffic.website.valid_for_yandex
# 		if inflow = Inflow.where(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id).take
# 			inflow.update!(annual_turnover: inflow.annual_turnover + traffic.annual_turnover)
# 		else
# 			Inflow.create!(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id, annual_turnover: traffic.annual_turnover)
# 		end
# 	end
# end

# mother_country = Country.where(name: "Korea, Republic of").take
# Inflow.where(exporter_country_id: mother_country.id).destroy_all
# Traffic.where(mother_country_id: mother_country.id).each do |traffic|
# 	if traffic.website.valid_for_yandex
# 		if inflow = Inflow.where(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id).take
# 			inflow.update!(annual_turnover: inflow.annual_turnover + traffic.annual_turnover)
# 		else
# 			Inflow.create!(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id, annual_turnover: traffic.annual_turnover)
# 		end
# 	end
# end

# mother_country = Country.where(name: "Germany").take
# Inflow.where(exporter_country_id: mother_country.id).destroy_all
# Traffic.where(mother_country_id: mother_country.id).each do |traffic|
# 	if traffic.website.valid_for_yandex
# 		if inflow = Inflow.where(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id).take
# 			inflow.update!(annual_turnover: inflow.annual_turnover + traffic.annual_turnover)
# 		else
# 			Inflow.create!(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id, annual_turnover: traffic.annual_turnover)
# 		end
# 	end
# end


# mother_country = Country.where(name: "Japan").take
# Inflow.where(exporter_country_id: mother_country.id).destroy_all
# Traffic.where(mother_country_id: mother_country.id).each do |traffic|
# 	if traffic.website.valid_for_yandex
# 		if inflow = Inflow.where(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id).take
# 			inflow.update!(annual_turnover: inflow.annual_turnover + traffic.annual_turnover)
# 		else
# 			Inflow.create!(exporter_country_id: mother_country.id, importer_country_id: traffic.country_id, annual_turnover: traffic.annual_turnover)
# 		end
# 	end
# end


# Traffic.all.each do |traffic|
# 	unless traffic.website.country_id == traffic.mother_country_id
# 	 	traffic.update!(mother_country_id: traffic.website.country_id)
# 	end 
# end

