class AddConceptualProductIdToLogicalProduct < ActiveRecord::Migration
  def change
    add_column :logical_products, :conceptual_product_id, :integer
  end
end
