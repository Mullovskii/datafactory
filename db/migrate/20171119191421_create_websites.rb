class CreateWebsites < ActiveRecord::Migration[5.1]
  def change
    create_table :websites do |t|
      t.references :country, foreign_key: true
      t.string :url
      t.references :company, foreign_key: true
      t.integer :category
      t.text :description
      t.text :contacts
      t.integer :monthly_visits, :limit => 8
      t.integer :country_rank
      t.boolean :valid_for_yandex
      t.integer :status
      t.decimal :bounce_rate
    end
  end
end
