class AddSortColumnsToMultipleTables < ActiveRecord::Migration
  def change
    add_column :studies, :sort_id, :interger
    add_column :study_units, :sort_id, :interger
    add_column :data_collections, :sort_id, :interger
    add_column :concept_groups, :sort_id, :interger
    add_column :conceptual_products, :sort_id, :interger
    add_column :questions, :sort_id, :interger
  end
end
