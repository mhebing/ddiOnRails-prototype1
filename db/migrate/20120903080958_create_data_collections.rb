class CreateDataCollections < ActiveRecord::Migration
  def change
    create_table :data_collections do |t|
      t.string :name
      t.string :label
      t.text :abstract
      t.integer :study_unit_id

      t.timestamps
    end
  end
end
