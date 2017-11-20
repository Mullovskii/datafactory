class ScryptController < ApplicationController

	def indonesia
		file = File.join(Rails.root, 'app', 'files', 'Indonesia', 'TopSites-(Shopping)--(360)--(Month-2017-10-1).xlsx')
	    # xlsx = Roo::Spreadsheet.open(file)
	    xlsx = Roo::Excelx.new(file)
	    # xlsx.sheet(1).column(1).each do |website|
	    # 	Website.create(url: website, country_id: Country.where(name: "Indonesia").take.id)
	    # end
	    respond_to do |format|
  			format.html { render(:text => "processed") }
	    end
	end

end
