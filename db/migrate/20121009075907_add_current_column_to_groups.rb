class AddCurrentColumnToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :current, :boolean
  end
end
