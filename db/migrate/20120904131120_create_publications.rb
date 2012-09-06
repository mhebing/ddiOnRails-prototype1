class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :author
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
