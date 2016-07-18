class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_set_id
      t.timestamps null: false
    end
  end
end
