class MoveQuestionSetIdToResponseSet < ActiveRecord::Migration
  def change
    remove_column :responses, :question_set_id
    add_column :response_sets, :question_set_id, :integer
  end
end
