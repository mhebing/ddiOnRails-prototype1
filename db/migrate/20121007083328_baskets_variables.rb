class BasketsVariables < ActiveRecord::Migration
  def change
    create_table :baskets_variables, id: false do |t|
      t.integer :basket_id
      t.integer :variable_id
    end
  end
end
