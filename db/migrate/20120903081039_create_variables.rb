class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :name
      t.string :label
      t.integer :physical_data_product_id
      t.integer :variable_group_id

      t.timestamps
    end
  end
end
