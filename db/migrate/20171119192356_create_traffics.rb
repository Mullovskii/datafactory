class CreateTraffics < ActiveRecord::Migration[5.1]
  def change
    create_table :traffics do |t|
      t.references :country, foreign_key: true
      t.references :website, foreign_key: true
      t.integer :country_share
      t.integer :country_visits
      t.integer :bounce_rate
      t.integer :country_visitors
      t.integer :annual_turnover

      t.timestamps
    end
  end
end
