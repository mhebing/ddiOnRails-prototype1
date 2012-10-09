class CreateConceptualProducts < ActiveRecord::Migration
  def change
    create_table :conceptual_products do |t|
      t.string :name
      t.text :label
      t.text :abstract

      t.timestamps
    end
  end
end
