class CreateHabbits < ActiveRecord::Migration[5.1]
  def change
    create_table :habbits do |t|
      t.references :country, foreign_key: true
      t.references :system, foreign_key: true
      t.integer :share, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
