# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create(name: "Indonesia", sales_region: true)

# SEED WEBSITES
	file = File.join(Rails.root, 'app', 'files', 'Indonesia', 'TopSites-(Shopping)--(360)--(Month-2017-10-1).xlsx')
    xlsx = Roo::Spreadsheet.open(file)
    xlsx = Roo::Excelx.new(file)
    xlsx.sheet(1).column(1).each do |website|
    	unless website == 'Domain'
    		Website.create(url: website, country_id: Country.where(name: "Indonesia").take.id)
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
		    	unless Country.where(name: hash[:country]).take
		    		Country.create(name: hash[:country])
		    	end	    
		    	unless Traffic.where(website_id: website.id, country_id: Country.where(name: hash[:country]).take).take
		    		Traffic.create(website_id: website.id, country_id: Country.where(name: hash[:country]).take.id, country_share: hash[:share]*100)
		    	end
		    end

 	end



  # file = File.join(Rails.root, 'app', 'files', 'Indonesia', 'GeographyExtended-(alibaba.com)--(999)--(Month_2017_10_1).xlsx')
  #   xlsx = Roo::Spreadsheet.open(file)
  #   xlsx = Roo::Excelx.new(file)
  #  	Website.where(url: "alibaba.com").take.update(monthly_visits: xlsx.sheet(1).cell(1,'J'))
  #  	website = Website.where(url: "alibaba.com").take

  #   hash = xlsx.sheet(1).each(country: 'Country', share: 'Traffic share') do |hash|
  #   	unless Country.where(name: hash[:country]).take
  #   		Country.create(name: hash[:country])
  #   	end	    
  #   	unless Traffic.where(website_id: website.id, country_id: Country.where(name: hash[:country]).take).take
  #   		Traffic.create(website_id: website.id, country_id: Country.where(name: hash[:country]).take.id, country_share: hash[:share]*100)
  #   	end
  #   end
