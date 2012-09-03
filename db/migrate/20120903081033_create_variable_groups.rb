class CreateVariableGroups < ActiveRecord::Migration
  def change
    create_table :variable_groups do |t|
      t.string :name
      t.string :label
      t.integer :logical_product_id
      t.integer :question_id
      t.integer :concept_id

      t.timestamps
    end
  end
end
