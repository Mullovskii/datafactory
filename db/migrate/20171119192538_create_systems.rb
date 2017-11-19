class CreateSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :systems do |t|
      t.string :name
      t.integer :payment_type
      t.text :description

      t.timestamps
    end
  end
end
