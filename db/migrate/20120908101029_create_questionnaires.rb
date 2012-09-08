class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :name
      t.string :label
      t.text :abstract
      t.integer :data_collection_id

      t.timestamps
    end
  end
end
