class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :label
      t.text :abstract
      t.integer :study_id

      t.timestamps
    end
  end
end
