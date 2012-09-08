class CreateQuestionScales < ActiveRecord::Migration
  def change
    create_table :question_scales do |t|
      t.integer :question_id
      t.integer :value
      t.string :label

      t.timestamps
    end
  end
end
