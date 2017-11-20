class CreateTraffics < ActiveRecord::Migration[5.1]
  def change
    create_table :traffics do |t|
      t.integer :mother_country_id
      t.references :country, foreign_key: true
      t.references :website, foreign_key: true
      t.decimal :country_share
      t.integer :country_visits, :limit => 8
      t.decimal :bounce_rate
      t.integer :country_visitors, :limit => 8
      t.integer :annual_turnover, :limit => 8

      t.timestamps
    end
  end
end
