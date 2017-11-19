class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.integer :average_bill
      t.integer :yandex_net_fee
      t.integer :yandex_share

      t.timestamps
    end
  end
end
