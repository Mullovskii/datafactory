class ChangeBitesForMarketvolume < ActiveRecord::Migration[5.1]
  def change
  	change_column :countries, :market_volume, :bigint
  	change_column :countries, :users, :bigint
  	change_column :countries, :shoppers, :bigint
  	change_column :countries, :game_market, :bigint
  end
end
