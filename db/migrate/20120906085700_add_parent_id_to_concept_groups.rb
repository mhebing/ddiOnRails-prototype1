class AddParentIdToConceptGroups < ActiveRecord::Migration
  def change
    add_column :concept_groups, :parent_id, :integer
  end
end
