class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :name
      t.string :label
      t.text :abstract
      t.integer :concept_group_id

      t.timestamps
    end
  end
end
