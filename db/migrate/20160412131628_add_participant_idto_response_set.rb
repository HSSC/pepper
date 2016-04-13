class AddParticipantIdtoResponseSet < ActiveRecord::Migration
  def change
    remove_column :response_sets, :question_set_id
    add_column :response_sets, :participant_identifier, :string
    add_column :responses, :question_set_id, :integer, :after => :response_set_id
  end
end
