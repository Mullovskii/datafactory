class AddSourceTypeToSystems < ActiveRecord::Migration[5.1]
  def change
    add_column :systems, :source_type, :integer
  end
end
