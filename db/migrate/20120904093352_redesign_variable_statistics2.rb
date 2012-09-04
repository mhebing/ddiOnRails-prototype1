class RedesignVariableStatistics2 < ActiveRecord::Migration
  def change
    remove_column :variable_statistics, :attribute
    add_column :variable_statistics, :statistic, :string
  end
end
