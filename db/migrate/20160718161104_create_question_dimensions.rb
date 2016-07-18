class CreateQuestionDimensions < ActiveRecord::Migration
  def change
    create_table :question_dimensions do |t|
      t.integer :count, null: false
      t.string  :color, null: false
      t.belongs_to :question
      t.timestamps null: false
    end

    add_attachment :question_dimensions, :image
  end
end
