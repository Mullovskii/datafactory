
Setting.create(average_bill: 80, yandex_net_fee: 0.8, yandex_share: 10, conversion: 3)
Country.create(name: "Indonesia", sales_region: true)

# SEED WEBSITES
	file = File.join(Rails.root, 'app', 'files', 'Indonesia', 'TopSites-(Shopping)--(360)--(Month-2017-10-1).xlsx')
    xlsx = Roo::Spreadsheet.open(file)
    xlsx = Roo::Excelx.new(file)
    xlsx.sheet(1).column(1).each do |website|
    	unless website == 'Domain'
    		Website.create(url: website, category: 0, status: 1, country_id: Country.where(name: "Indonesia").take.id)
    	end
    end


# SEED TRAFFICS
 	Website.all.each do |site|
		file = File.join(Rails.root, 'app', 'files', 'Indonesia', "GeographyExtended-(#{site.url})--(999)--(Month_2017_10_1).xlsx")
	    xlsx = Roo::Spreadsheet.open(file)
	    xlsx = Roo::Excelx.new(file)
	   	Website.where(url: site.url).take.update(monthly_visits: xlsx.sheet(1).cell(1,'J'))
	   	website = Website.where(url: site.url).take

	    hash = xlsx.sheet(1).each(country: 'Country', share: 'Traffic share') do |hash|
	    	unless Country.where(name: hash[:country]).take || hash[:country] == 'Country'
	    		Country.create(name: hash[:country])
	    	end	    
	    	unless Traffic.where(website_id: website.id, country_id: Country.where(name: hash[:country]).take).take 
	    		unless hash[:country] == 'Country' || website.url == 'Domain' 
	    			Traffic.create(website_id: website.id, country_id: Country.where(name: hash[:country]).take.id, country_share: hash[:share]*100)	
	    		end
	    	end
	    end
 	end











