class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :name
      t.string :label
      t.text :abstract
      t.text :universe

      t.timestamps
    end
  end
end
