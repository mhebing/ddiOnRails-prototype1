class CreatePhysicalInstances < ActiveRecord::Migration
  def change
    create_table :physical_instances do |t|
      t.integer :physical_data_product_id
      t.string :name
      t.string :label
      t.text :description
      t.string :filename
      t.string :format
      t.string :fingerprint

      t.timestamps
    end
  end
end
