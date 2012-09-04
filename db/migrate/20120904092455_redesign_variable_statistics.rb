class RedesignVariableStatistics < ActiveRecord::Migration
  def change
    drop_table :variable_statistics
    create_table :variable_statistics do |t|
      t.integer :variable_id
      t.string :attribute
      t.decimal :value
    end
  end
end
