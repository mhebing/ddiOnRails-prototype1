class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :label
      t.string :fix_name
      t.text :description

      t.timestamps
    end
  end
end
