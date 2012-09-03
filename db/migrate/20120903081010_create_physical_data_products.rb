class CreatePhysicalDataProducts < ActiveRecord::Migration
  def change
    create_table :physical_data_products do |t|
      t.string :name
      t.string :label
      t.integer :group_id
      t.integer :logical_product_id

      t.timestamps
    end
  end
end
