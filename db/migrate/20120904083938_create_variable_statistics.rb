class CreateVariableStatistics < ActiveRecord::Migration
  def change
    create_table :variable_statistics do |t|
      t.integer :variable_id
      t.integer :valid
      t.integer :invalid
      t.decimal :mean
      t.decimal :min
      t.decimal :max

      t.timestamps
    end
  end
end
