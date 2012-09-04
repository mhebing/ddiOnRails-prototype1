class RolesIntoUsers < ActiveRecord::Migration
  def change
    drop_table :roles
    add_column :users, :admin, :boolean
  end
end
