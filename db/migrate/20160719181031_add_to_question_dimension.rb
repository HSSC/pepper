class AddToQuestionDimension < ActiveRecord::Migration
  def change
    add_column :question_dimensions, :help_text_description, :text
    add_column :response_dimensions, :help_text_description, :text
  end
end
