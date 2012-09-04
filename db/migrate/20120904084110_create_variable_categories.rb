class CreateVariableCategories < ActiveRecord::Migration
  def change
    create_table :variable_categories do |t|
      t.integer :variable_id
      t.integer :value
      t.string :label
      t.integer :frequency

      t.timestamps
    end
  end
end
