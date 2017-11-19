class CreateSetups < ActiveRecord::Migration[5.1]
  def change
    create_table :setups do |t|
      t.references :website, foreign_key: true
      t.integer :average_bill
      t.integer :yandex_net_fee
      t.integer :yandex_share

      t.timestamps
    end
  end
end
