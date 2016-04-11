class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.integer :survey_id
      t.string :participant_identifier
      t.text :descriptors
      t.boolean :used

      t.timestamps null: false
    end
  end
end
