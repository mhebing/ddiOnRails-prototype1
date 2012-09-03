class CreateConceptGroups < ActiveRecord::Migration
  def change
    create_table :concept_groups do |t|
      t.string :name
      t.string :label
      t.text :abstract

      t.timestamps
    end
  end
end
