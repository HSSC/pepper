class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.integer :survey_id
      t.string :participant_identifier
      t.string :title
      t.string :subtitle
      t.boolean :used

      t.timestamps null: false
    end
  end
end
