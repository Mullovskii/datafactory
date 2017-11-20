class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.integer :average_bill
      t.decimal :yandex_net_fee
      t.decimal :yandex_share

      t.timestamps
    end
  end
end
