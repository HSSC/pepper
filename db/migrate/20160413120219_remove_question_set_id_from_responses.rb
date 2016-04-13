class RemoveQuestionSetIdFromResponses < ActiveRecord::Migration
  def change
    remove_column :responses, :question_set_id
  end
end
