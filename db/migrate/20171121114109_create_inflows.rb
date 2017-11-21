class CreateInflows < ActiveRecord::Migration[5.1]
  def change
    create_table :inflows do |t|
      t.integer :exporter_country_id
      t.integer :importer_country_id
      t.integer :annual_turnover, :limit => 8

      t.timestamps
    end
  end
end
