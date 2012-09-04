class CreateBasketsVariableGroups < ActiveRecord::Migration
  def change
    create_table :baskets_variable_groups, id: false do |t|
      t.integer :basket_id
      t.integer :variable_group_id
    end
  end
end
