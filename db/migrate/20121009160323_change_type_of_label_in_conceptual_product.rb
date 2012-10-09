class ChangeTypeOfLabelInConceptualProduct < ActiveRecord::Migration
  def change
    remove_column :conceptual_products, :label
    add_column :conceptual_products, :label, :string
  end
end
