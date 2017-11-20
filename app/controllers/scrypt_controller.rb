class ScryptController < ApplicationController

	def indonesia
	# SEED WEBSITES
		# file = File.join(Rails.root, 'app', 'files', 'Indonesia', 'TopSites-(Shopping)--(360)--(Month-2017-10-1).xlsx')
	 #    xlsx = Roo::Spreadsheet.open(file)
	 #    xlsx = Roo::Excelx.new(file)
	 #    xlsx.sheet(1).column(1).each do |website|
	 #    	Website.create(url: website, country_id: Country.where(name: "Indonesia").take.id)
	 #    end

	# SEED TRAFFICS

	 	file = File.join(Rails.root, 'app', 'files', 'Indonesia', 'GeographyExtended-(alibaba.com)--(999)--(Month_2017_10_1).xlsx')
	    xlsx = Roo::Spreadsheet.open(file)
	    xlsx = Roo::Excelx.new(file)
	   	Website.where(url: "alibaba.com").take.update(monthly_visits: xlsx.sheet(1).cell(1,'J'))
	   	website = Website.where(url: "alibaba.com").take

	    hash = xlsx.sheet(1).each(country: 'Country', share: 'Traffic share') do |hash|
	    	unless Country.where(name: hash[:country]).take
	    		Country.create(name: hash[:country])
	    	end	    
	    	unless Traffic.where(website_id: website.id, country_id: Country.where(name: hash[:country]).take).take
	    		Traffic.create(website_id: website.id, country_id: Country.where(name: hash[:country]).take.id, country_share: hash[:share]*100)
	    	end
	    end

	    respond_to do |format|
  			format.html { render(:text => "processed") }
	    end
	end

end
