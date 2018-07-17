class CreateQuestionAttributes < ActiveRecord::Migration
  def change
    create_table :question_attributes do |t|
      t.integer :question_id
      t.text :description
      t.string :panel_title
      t.text :panel_description
      t.attachment :image

      t.timestamps null: false
    end
  end
end
