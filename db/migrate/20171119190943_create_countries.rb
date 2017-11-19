class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.boolean :sales_region
      t.boolean :importer_region
      t.integer :market_volume
      t.integer :users
      t.integer :shoppers
      t.integer :game_market
      t.text :description

      t.timestamps
    end
  end
end
